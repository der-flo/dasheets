class Dasheets::DSL::Context
  def initialize(filename)
    instance_eval(File.read(filename))
  end
  def generate
    Dasheets::Creator.new(@data).generate
  end
  private

  def cheatsheet(&block)
    @data = Dasheets::DSL::Cheatsheet.new(&block)
  end
end
