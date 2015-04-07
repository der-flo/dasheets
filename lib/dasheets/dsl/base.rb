require 'minidown'
require 'sanitize'

module Dasheets
  module DSL
    class Base
      def initialize(&block)
        instance_eval(&block)
      end
      private

      def self.define_attrs(*names)
        names.each do |name|
          define_method(name) do |val = nil|
            instance_variable_set("@#{name}", val) if val
            instance_variable_get("@#{name}")
          end
        end
      end
      def self.define_markdown_attrs(*names)
        names.each do |name|
          define_method(name) do |val = nil|
            if val
              val = Minidown.render(val)
              instance_variable_set("@#{name}", val)
            end
            instance_variable_get("@#{name}")
          end
          define_method("tags_stripped_#{name}") do
            Sanitize.clean(send(name))
          end
        end
      end
    end
  end
end
