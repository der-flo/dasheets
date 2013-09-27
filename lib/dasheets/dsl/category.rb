class Dasheets::DSL::Category
  attr_reader :entries
  def initialize(&block)
    @entries = []
    instance_eval(&block)
  end

  def id(id = nil)
    @id = id if id
    @id
  end
  def entry(&block)
    @entries << Dasheets::DSL::Entry.new(&block)
  end
end
