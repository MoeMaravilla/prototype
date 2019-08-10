#!/usr/bin/ruby

require "rexml/document" 
source = $stdin.readlines.join("\n")

doc = REXML::Document.new(source)
formatter = REXML::Formatters::Pretty.new

# Compact uses as little whitespace as possible
formatter.compact = true
formatter.write(doc, $stdout)
