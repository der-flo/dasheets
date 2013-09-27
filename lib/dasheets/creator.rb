require 'plist'
require 'sqlite3'
require 'fileutils'
require 'haml'
require 'ostruct'

class Dasheets::Creator
  def initialize(cheatsheet)
    @cheatsheet = cheatsheet
    @path = "#{@cheatsheet.short_name}.docset/Contents/"
  end

  def generate
    FileUtils.rm_rf(@path)
    FileUtils.mkdir_p(@path)
    generate_html_file
    generate_plist_file
    generate_database
  end

  private

  def generate_html_file
    tpl_path = File.expand_path('../templates', __FILE__)

    # HTML
    template = File.read("#{tpl_path}/template.haml")
    engine = Haml::Engine.new(template)
    out = engine.render(@cheatsheet)
    doc_path = "#{@path}Resources/Documents/"
    FileUtils.mkdir_p(doc_path)
    File.open("#{doc_path}index.html", 'w') { |file| file.write(out) }

    # (static) CSS
    FileUtils.cp("#{tpl_path}/style.css", doc_path)
  end

  def generate_plist_file
    plist_data = {
      'CFBundleIdentifier' => @cheatsheet.short_name,
      'CFBundleName' => @cheatsheet.title,
      'DocSetPlatformFamily' => @cheatsheet.short_name,
      'isDashDocset' => true,
      'dashIndexFilePath' => 'index.html'
    }
    File.open("#{@path}Info.plist", 'w') do |file|
      file.write(Plist::Emit.dump(plist_data))
    end
  end

  def generate_database
    sqlite_file = "#{@path}Resources/docSet.dsidx"
    db = SQLite3::Database.new(sqlite_file)
    db.execute <<-SQL
      CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT,
                               type TEXT, path TEXT);
      CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);
    SQL
    @cheatsheet.categories.each do |category|
      category.entries.each_with_index do |entry, index|
        sql = 'INSERT INTO searchIndex(name, type, path) VALUES (?, ?, ?)'
        db.execute(sql, entry.name, 'Guide',
                   "index.html\##{category.id}-#{index}")
      end
    end
  end
end
