#!/usr/bin/ruby -w

module Module1
  def initialize
    puts "ini from Module1"
  end

  def fun1
    puts "fun1 from Module1"
  end

  def self.included(base)
    def fun2
        puts "fun2 from Module1"
    end
  end
end

module Module2
  def initialize
    puts "ini from Module2"
  end

  def foo
    puts "foo from Module2"
  end

  def self.extended(base)
    def bar
        puts "bar from Module2"
    end
  end
end

class Test
  include Module1
  extend Module2

  # Defining an initialize here overloads the one from Module1
  # But want to define one here and call the prior ini from within

  def abc
    puts "abc from Test"
  end
end

Module1.fun

t1 = Test.new # ini from Module1
t1.abc        #=> abc from Test
t1.fun1       #=> fun1 from Module1
t1.fun2       #=> fun2 from Module1
Test.foo      #=> foo from Module2
Test.bar      #=> bar from Module2

class Test2
  include Module1  # ./class2.rb:13: warning: method redefined; discarding old fun2
                   # ./class2.rb:13: warning: previous definition of fun2 was here
  def abc
    puts "abc from Test2"
  end
end

t2 = Test2.new # ini from Module1
t2.extend(Module2) # ./class2.rb:29: warning: method redefined; discarding old bar
                   # ./class2.rb:29: warning: previous definition of bar was here
t2.abc  # abc from Test2
t2.fun1 # fun1 from Module1
t2.fun2 # fun2 from Module1
t2.foo  # foo from Module2
t2.bar  # bar from Module2
