#!/usr/bin/ruby

require 'json'

source = $stdin.readlines.join("\n")
puts(JSON.pretty_generate(JSON[source]))
