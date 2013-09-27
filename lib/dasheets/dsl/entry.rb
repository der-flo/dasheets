class Dasheets::DSL::Entry
  def initialize(&block)
    instance_eval(&block)
  end
  def name(name = nil)
    @name = name if name
    @name
  end
  def command(c = nil)
    @command = c if c
    @command
  end
  def notes(n = nil)
    @notes = n if n
    @notes
  end
end
