require 'thor'

module Dasheets
  class CLI < Thor
    desc 'generate FILE', 'Generates cheatsheet out of a file'
    def generate(file)
      context = Dasheets::DSL::Context.new(file)
      context.generate
    end
  end
end
