require 'dasheets/version'

module Dasheets
  module DSL
  end
end

%w(creator dsl/cheatsheet dsl/category dsl/context dsl/entry).each do |file|
  require "dasheets/#{file}"
end
