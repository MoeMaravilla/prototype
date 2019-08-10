#!/usr/bin/ruby -w

# Sample module to be included or extended
module Foo
  def initialize
  end

  def foo
    puts 'Called foo'
  end

  def self.foot
    puts 'Called foot'
  end
end

# Bar will include Foo
# So the methods defined in Foo become methods in Bar
class Bar
  include Foo

  def boo
    puts 'Called boo'
  end

  def self.boot
    puts 'Called boot'
  end
end

# Object calls of foo and boo (using Bar)
bar = Bar.new
bar.foo         # Called foo
bar.boo         # Called boo
#bar.foot       # undefined method `foot' for #<Bar:0x00000000a767a0> (NoMethodError)
#bar.boot       # undefined method `boot' for #<Bar:0x00000000a767a0> (NoMethodError)

# Class calls of foo and boo (using Bar)
#Bar.foo        # undefined method `foo' for Bar:Class (NoMethodError)
#Bar.boo        # undefined method `boo' for Bar:Class (NoMethodError)
#Bar.boot       # undefined method `boot' for #<Bar:0x000000012ea760> (NoMethodError)

# Baz will extend Foo
# So the methods defined in Foo become Class callable in Baz
class Baz
  extend Foo

  def bar
    puts 'barrr!'
  end

  def self.bar_obj
    puts 'barrr!'
  end
end

# Class calls of foo and bar(using Baz)
Baz.foo         # heyyyyoooo!
#Baz.bar        # undefined method `bar' for Baz:Class (NoMethodError)

# Object calls of foo and bar (using Baz)
Baz.new.bar     # undefined method `bar' for Baz:Class (NoMethodError)
#Baz.new.foo    # undefined method `foo' for #<Baz:0x00000001f4fd70> (NoMethodError
