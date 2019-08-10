#! /usr/bin/ruby -w

module Humor
  def tickle
    "hee, hee!"
  end

  private

  def tackle
    "hee, hee!"
  end
end

class Grouchy
  include Humor
  extend  Humor
end

module Test
  extend Humor
end

puts Grouchy.tickle
# "hee, hee!"
a = Grouchy.new
puts a.tickle
puts Test.tickle
puts Test.tackle

# Not callable
#Humor.tackle
#Humor.tickle
