require 'minidown'

# TODO: Refactor Minidown usage?

class Dasheets::DSL::Entry
  def initialize(&block)
    instance_eval(&block)
  end
  def name(name = nil)
    if name
      @name = Minidown.parse(name).to_html
    end
    @name
  end
  def command(c = nil)
    @command = c if c
    @command
  end
  def notes(n = nil)
    if n
      @notes = Minidown.parse(n).to_html
    end
    @notes
  end
end
