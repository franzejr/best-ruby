# Ruby Tricks

[![Join the chat at https://gitter.im/franzejr/ruby-tricks](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/franzejr/ruby-tricks?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

The majority of these Ruby Tricks were extracted from James Edward Gray II [talk](https://www.youtube.com/watch?v=aBgnlBoIkVM).
If you know some other tricks, please contribute!
    
## Table of Contents

- [Associative arrays](#associative-arrays)
- [Autovivification](#autovivification)
- [Blocks can take blocks](#blocks-can-take-blocks)
- [Bubbling up thread errors](#bubbling-up-thread-errors)
- [Case on ranges](#case-on-ranges)
- [Count all objects](#count-all-objects)
- [Cycle](#cycle)
- [Data](#data)
- [Easiest database pstore](#easiest-database-pstore)
- [Easiest database pstore yaml](#easiest-database-pstore-yaml)
- [Enable garbage collector profiler](#enable-garbage-collector-profiler)
- [Enable ruby warnings](#enable-ruby-warnings)
- [Fast memoization fibonacci](#fast-memoization-fibonacci)
- [Fetch data](#fetch-data)
- [Get random data](#get-random-data)
- [Head tail](#head-tail)
- [Inject](#inject)
- [Inspecting the source with script lines](#inspecting-the-source-with-script-lines)
- [Iterating over specific types](#iterating-over-specific-types)
- [Lambda your own syntax](#lambda-your-own-syntax)
- [Memoization](#memoization)
- [Print formatted with debug](#print-formatted-with-debug)
- [Ruby debug flag](#ruby-debug-flag)
- [Shortcut variable interpolation](#shortcut-variable-interpolation)
- [Single instance running](#single-instance-running)
- [Smalltalk conditionals](#smalltalk-conditionals)
- [Splat operator](#splat-operator)
- [Stab operator](#stab-operator)
- [Struct without assignment](#struct-without-assignment)
- [Super magic method](#super-magic-method)
- [Super magic method2](#super-magic-method2)
- [Super magic method3](#super-magic-method3)
- [Super magic method4](#super-magic-method4)
- [Super magic method5](#super-magic-method5)
- [Tail call](#tail-call)
- [Trigger irb as needed](#trigger-irb-as-needed)
- [Unused variable format](#unused-variable-format)
- [Variables from a regex](#variables-from-a-regex)
- [Zip](#zip)

## Tricks

### Associative arrays

        ```ruby
      aa = [ %w[Someone 1],
      %w[Bla 2]]

p aa.assoc("Someone")
p aa.assoc("Bla")

# Result:
# ["Someone", "1"]
# ["Bla", "2"]

p aa.rassoc("1")
p aa.rassoc("2")

# Result:
# ["Someone", "1"]
# ["Bla", "2"]

        ```

        [View Source](associative_arrays.rb)

      
### Autovivification

        ```ruby
      deep = Hash.new { |hash,key| hash[key] = Hash.new(&hash.default_proc) }


deep[:a][:b][:c][:d] = 42
p deep

# Result:
# {:a=>{:b=>{:c=>{:d=>42}}}}

        ```

        [View Source](autovivification.rb)

      
### Blocks can take blocks

        ```ruby
      var = :var
object = Object.new

object.define_singleton_method(:show_var_and_block) do |&block|
  p [var, block]
end

object.show_var_and_block { :block }

# Result:
# [:var, #<Proc:0x007ffd6c038128@./blocks_can_take_blocks.rb:8>]

        ```

        [View Source](blocks_can_take_blocks.rb)

      
### Bubbling up thread errors

        ```ruby
      Thread.abort_on_exception = true

Thread.new do
  fail 'Ops, we cannot continue'
end

loop do
  sleep
end

# Result:
# ./bubbling_up_thread_errors.rb:4:in `block in <main>': Ops, we cannot continue (RuntimeError)

        ```

        [View Source](bubbling_up_thread_errors.rb)

      
### Case on ranges

        ```ruby
      age = rand(1..100)
p age

case age
  when -Float::INFINITY..20
    p 'You are too young'
  when 21..64
    p 'You are at the right age'
  when 65..Float::INFINITY
    p 'You are too old'
end

# Result:
# 55
# "You are at the right age"

        ```

        [View Source](case_on_ranges.rb)

      
### Count all objects

        ```ruby
      require 'pp'

pp ObjectSpace.count_objects

# Result:
# {:TOTAL=>30163,
#  :FREE=>1007,
#  :T_OBJECT=>39,
#  :T_CLASS=>534,
#  :T_MODULE=>24,
#  :T_FLOAT=>4,
#  :T_STRING=>9290,
#  :T_REGEXP=>70,
#  :T_ARRAY=>2231,
#  :T_HASH=>53,
#  :T_STRUCT=>1,
#  :T_BIGNUM=>2,
#  :T_FILE=>14,
#  :T_DATA=>966,
#  :T_MATCH=>1,
#  :T_COMPLEX=>1,
#  :T_NODE=>15896,
#  :T_ICLASS=>30}

        ```

        [View Source](count_all_objects.rb)

      
### Cycle

        ```ruby
      ring = %w[one two three].cycle

p ring.take(5)

# Result:
# ["one", "two", "three", "one", "two"]

        ```

        [View Source](cycle.rb)

      
### Data

        ```ruby
      puts DATA.read

__END__
Hey oh!
Hey oh!

        ```

        [View Source](data.rb)

      
### Easiest database pstore

        ```ruby
      require 'pstore'

db = PStore.new('mydatabase.pstore')

db.transaction do
  db['people1'] = 'Someone'
  db['money1'] = 400
end

db.transaction do
  db['people2'] = 'Someone2'
  db['money2'] = 300
end


db.transaction(true) do
  p 'People %p' % db['people1']
  p 'Money %p' % db['money1']
  p "SECOND PERSON"
  p 'People %p' % db['people2']
  p 'Money %p' % db['money2']
end

# Result:
# "People \"Someone\""
# "Money 400"
# "SECOND PERSON"
# "People \"Someone2\""
# "Money 300"

        ```

        [View Source](easiest_database_pstore.rb)

      
### Easiest database pstore yaml

        ```ruby
      require 'yaml/store'

db = YAML::Store.new('people.yml')

db.transaction do
  db['people1'] = 'Someone'
  db['money1'] = 400
end

db.transaction do
  db['people2'] = 'Someone2'
  db['money2'] = 300
end


db.transaction(true) do
  p 'People %p' % db['people1']
  p 'Money %p' % db['money1']
  p "SECOND PERSON"
  p 'People %p' % db['people2']
  p 'Money %p' % db['money2']
end

# Result:
# "People \"Someone\""
# "Money 400"
# "SECOND PERSON"
# "People \"Someone2\""
# "Money 300"

        ```

        [View Source](easiest_database_pstore_yaml.rb)

      
### Enable garbage collector profiler

        ```ruby
      GC::Profiler.enable

10.times do
  array = Array.new(1_000_000) { |i| i.to_s }
end

puts GC::Profiler.result

        ```

        [View Source](enable_garbage_collector_profiler.rb)

      
### Enable ruby warnings

        ```ruby
      $VERBOSE = true

class WarnMe
  def var
    @var || 42
  end
end


p WarnMe.new.var


# Result:
# ./enable_ruby_warnings.rb:5: warning: instance variable @var not initialized
# 42

        ```

        [View Source](enable_ruby_warnings.rb)

      
### Fast memoization fibonacci

        ```ruby
      fibonacci = Hash.new{ |numbers,index|
  numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
}.update(0 => 0, 1 => 1)


p fibonacci[300]

# Result:
# 222232244629420445529739893461909967206666939096499764990979600

        ```

        [View Source](fast_memoization_fibonacci.rb)

      
### Fetch data

        ```ruby
      params = {var: 42}

p params.fetch(:var)
p params.fetch(:missing, 42)
p params.fetch(:missing) { 40 + 2 }

params.fetch(:missing)


# Result:
# 42
# 42
# 42
# ./fetch_data.rb:7:in `fetch': key not found: :missing (KeyError)
# 	from ./fetch_data.rb:7:in `<main>'

        ```

        [View Source](fetch_data.rb)

      
### Get random data

        ```ruby
      require 'securerandom'

p SecureRandom.random_number
p SecureRandom.random_number(100)
p
p SecureRandom.hex(20)
p SecureRandom.base64(20)

# Result:
# 0.7851536586163714
# 46
# "3efb674fbc2ba390856c15489652e75e8afff6d1"
# "yFv0WzugzFC6/D71teVe1Y5r1kU="

        ```

        [View Source](get_random_data.rb)

      
### Head tail

        ```ruby
      def my_reduce(array)
    head, *tail = array
    return (tail.empty? ? head : (head + my_reduce(tail)))
end

# triangular number example
n = 100
my_reduce((1..n).to_a) == (n*(n+1))/2 #=> True

        ```

        [View Source](head_tail.rb)

      
### Inject

        ```ruby
      p (1..10).inject{ |r,e| p [r,e]; r*2}


# Result:
# [1, 2]
# [2, 3]
# [4, 4]
# [8, 5]
# [16, 6]
# [32, 7]
# [64, 8]
# [128, 9]
# [256, 10]
# 512

        ```

        [View Source](inject.rb)

      
### Inspecting the source with script lines

        ```ruby
      SCRIPT_LINES__ = { }

#require_relative = 'better_be_well_formed_code'
require_relative = 'better_be_well_formed_code_with_a_line_size_greather_than_80_it_is_not_good'

if SCRIPT_LINES__.values.flatten.any? { |line| line.size > 80}
  abort 'Clean up your code first!'
end

        ```

        [View Source](inspecting_the_source_with_script_lines.rb)

      
### Iterating over specific types

        ```ruby
      ObjectSpace.each_object(String) do |object|
  p object
end

# Result:
# "block in dependent_specs"
# "block in dependent_specs"
# "block (3 levels) in dependent_gems"
# "block (3 levels) in dependent_gems"
# ... (huge output suppressed)
# "This rdoc is bundled with Ruby"

        ```

        [View Source](iterating_over_specific_types.rb)

      
### Lambda your own syntax

        ```ruby
      # encoding UTF-8

module Kernel
  alias_method :λ, :lambda
end

l = λ { p :called }
l.call

# Result:
# :called

        ```

        [View Source](lambda_your_own_syntax.rb)

      
### Memoization

        ```ruby
      # based on Justin Weiss' article:
# http://www.justinweiss.com/articles/4-simple-memoization-patterns-in-ruby-and-one-gem/

class Memoize
  # one liner
  def my_simple_method
    @my_simple_method ||= do_some_calculation
  end

  # multiple lines
  def my_more_complex_method
    @my_more_complex_method ||= begin
      a = do_some_calculation
      b = do_some_more_calculation
      a + b
    end
  end

  # what if our calculations return nil?...

  # one liner
  def my_simple_method
    return @my_simple_method if defined? @my_simple_method
    @my_simple_method = do_some_calculation
  end

  # multiple lines
  def my_more_complex_method
    return @my_more_complex_method if defined? @my_more_complex_method
    @my_more_complex_method = begin
      a = do_some_calculation
      b = do_some_more_calculation
      a + b
    end
  end

  # what about differing arguments?...

  def my_really_complex_method(*args)
    @my_really_complex_method ||= Hash.new do |h, key|
      h[key] = do_some_calculation(*key)
    end
    @my_really_complex_method[args]
  end
end

        ```

        [View Source](memoization.rb)

      
### Print formatted with debug

        ```ruby
      def debug(name, content)
  p "%s:  %p" % [name, content]
end

debug "Num", 42

# Result:
# "Num:  42"

        ```

        [View Source](print_formatted_with_debug.rb)

      
### Ruby debug flag

        ```ruby
      def var
  @var || 40
end

if $DEBUG
  p "var is %p" % var
end

p var + 2

# Result:
# ruby_debug_flag.rb:2: warning: instance variable @var not initialized
# "var is 40"
# ruby_debug_flag.rb:2: warning: instance variable @var not initialized
# 42

        ```

        [View Source](ruby_debug_flag.rb)

      
### Shortcut variable interpolation

        ```ruby
      @instance = :instance
@@class = :class
$global = :global

p "#@instance, #@@class, and #$global variables don't need braces"

# Result:
# "instance, class, and global variables don't need braces"

        ```

        [View Source](shortcut_variable_interpolation.rb)

      
### Single instance running

        ```ruby
      DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already running'

trap('INT', 'EXIT')
puts 'Running...'
loop do
  sleep
end

__END__
DO NOT DELETE: used for locking

        ```

        [View Source](single_instance_running.rb)

      
### Smalltalk conditionals

        ```ruby
      def  true.-(a, &b); a[] end
def false.-(a, &b); b[] end

puts (1 == 1).--> { :ok } { :different }
puts (4 == 2).--> { :ok } { :different }

# Result:
# # ok
# # different

        ```

        [View Source](smalltalk_conditionals.rb)

      
### Splat operator

        ```ruby
      # Splat Operator (*) 

# When calling methods

arguments = [1, 2, 3, 4]
my_method(*arguments) # any number of arguments

# or:

arguments = [2, 3, 4]
my_method(1, *arguments) # any number of trailing arguments

# or:

arguments = [1, 2]
my_method(*arguments, 3, 4) # any number of preceding arguments

# or:

arguments = [2, 3]
my_method(1, *arguments, 4) # any number of "in between" arguments

# All are equivalent to:

my_method(1, 2, 3, 4)

# Two splats (**) convert a hash into an arbitary number of keyword arguments
# This operator doesn't technically have a name

arguments = { first: 1, second: 2, third: 3 }
my_method(**arguments)

# or:

arguments = { first: 1, second: 2 }
my_method(third: 3, **arguments)

# Are equivalent to:

my_method(first:1, second:2, three:3)

        ```

        [View Source](splat_operator.rb)

      
### Stab operator

        ```ruby
      # Stab Operator - Lambdas in Ruby 1.9 or later.
# Y Combinator
# Ruby supports a syntax for lambdas known as the 'stab' operator.
# Rather than something like lambda { a < 5 },
# you can type -> { a < 5 }.
#
# Below is a version of the fibonacci sequence that can
# perform recursive calls without named functions.
#
# Improver function for fibonacci sequence
# Assumes that the 0th element of the sequence is 0,
# and the 1st element of the sequence is 1.
fib_improver = ->(partial) {
  ->(n) { n < 2 ? n : partial.(n-1) + partial.(n-2) }
}

# The y combinator
y = ->(f) {
  ->(x) { x.(x) }.(
    ->(x) { f.(->(v) { x.(x).(v)}) }
  )
}

# Using the stab operator and y combinator, we can
# write a fibonacci function with anonymous functions
# This solution is not memoized and so will be very slow.
fib = fib_improver.(y.(fib_improver))

p fib.(1)

p fib.(10)
# Notice that after loading, fib isn't defined anymore.

        ```

        [View Source](stab_operator.rb)

      
### Struct without assignment

        ```ruby
      Struct.new("Name", :first, :last) do
  def full
    "#{first} #{last}"
  end
end

franzejr = Struct::Name.new("Franze", "Jr")
p franzejr.full

# Result:
# "Franze Jr"

        ```

        [View Source](struct_without_assignment.rb)

      
### Super magic method

        ```ruby
      class Parent
  def show_args(*args)
    p args
  end
end

class Child < Parent
  def show_args(a,b,c)
    super(a,b,c)
  end
end

Child.new.show_args(:a, :b, :c)

# Result:
# [:a, :b, :c]

        ```

        [View Source](super_magic_method.rb)

      
### Super magic method2

        ```ruby
      class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    super
  end
end

#Everything goes up, including the block
Child.new.show_args(:a, :b, :c) { :block }

# Result:
# [:a, :b, :c, #<Proc:0x007f9bd288bfb0@./super_magic_key_word2.rb:14>]

        ```

        [View Source](super_magic_method2.rb)

      
### Super magic method3

        ```ruby
      class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    # Call super without any params
    # making args an empty array []
    super()
  end
end

#Nothing goes up
Child.new.show_args(:a, :b, :c)

# Result:
# [nil]

        ```

        [View Source](super_magic_method3.rb)

      
### Super magic method4

        ```ruby
      class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    # modify super by passing nothing
    # calling super with a nil proc,
    # which is basically calling super()
    super(&nil)
  end
end

#Nothing goes up, neither the block
Child.new.show_args(:a, :b, :c) { :block }

# Result:
# [nil]

        ```

        [View Source](super_magic_method4.rb)

      
### Super magic method5

        ```ruby
      class DontDelegateToMe; end
class DelegateToMe; def delegate; "DelegateToMe" end end

module DelegateIfCan
  def delegate
    if defined? super
      "Modified:  #{super}"
    else
      "DelegateIfCan"
    end
  end
end

p DelegateToMe.new.extend(DelegateIfCan).delegate
p DontDelegateToMe.new.extend(DelegateIfCan).delegate

# Result:
# "Modified:  DelegateToMe"
# "DelegateIfCan"

        ```

        [View Source](super_magic_method5.rb)

      
### Tail call

        ```ruby
      RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
                                               trace_instruction: false }

eval <<end
  def factorial(n, result=1)
    if n==1
      result
    else
      factorial(n-1, n*result)
    end
  end
end

p factorial(100000)

# Result:

        ```

        [View Source](tail_call.rb)

      
### Trigger irb as needed

        ```ruby
      require 'irb'

def my_program_context
  @my_program_context ||= Struct.new(:value).new(40)
end

trap(:INT) do
  IRB.start
  trap(:INT, 'EXIT')
end

loop do
  p "Current value: #{my_program_context.value}"
  sleep 1
end

# Result:
# "Current value: 40"
# "Current value: 40"

        ```

        [View Source](trigger_irb_as_needed.rb)

      
### Unused variable format

        ```ruby
        [
    ['Someone', 41, 'another field'],
    ['Someone2', 42, 'another field2'],
    ['Someone3', 43, 'another field3']
  ].each do |name,_,_|
    p name
  end

# Result:
# "Someone"
# "Someone2"
# "Someone3"

        ```

        [View Source](unused_variable_format.rb)

      
### Variables from a regex

        ```ruby
      if  /\A(?<first>\w+),\s*(?<last>\w+)\z/ =~ "Franze, Jr"
  puts "#{first} #{last}"
end

# Result:
# Franze Jr

        ```

        [View Source](variables_from_a_regex.rb)

      
### Zip

        ```ruby
      letters = "a".."d"
numbers = 1..3

letters.zip(numbers) do |letter, number|
  p(letter: letter, number: number)
end

# Result:
# {:letter=>"a", :number=>1}
# {:letter=>"b", :number=>2}
# {:letter=>"c", :number=>3}
# {:letter=>"d", :number=>nil}

        ```

        [View Source](zip.rb)

      
## Contributors

- [@JEG2](https://github.com/JEG2)
- [@franzejr](https://github.com/franzejr)
- [@rafaelsales](https://github.com/rafaelsales)
- [@jomagam](https://github.com/jomagam)
- [@fredkelly](https://github.com/fredkelly)
- [@shadefinale](https://github.com/shadefinale)
- [@matugm](https://github.com/matugm)
- [@lightyrs](https://github.com/lightyrs)
- [@ilyakava](https://github.com/ilyakava)
- [@dansandland](https://github.com/dansandland)
- [@xzgyb](https://github.com/xzgyb)
- [@filipebarcos](https://github.com/filipebarcos)
- [@ezekg](https://github.com/ezekg)
- [@0x0dea](https://github.com/0x0dea)

## Contributing

1. Fork it
1. Create your trick branch: `git checkout -b my-ruby-trick`
1. Add your trick to the collection of `.rb` files
1. Regenerate `README.md`: `rake build` (install Rake with `bundle`)
1. Commit your changes: `git commit -am 'Add trick'`
1. Push to the branch: `git push origin my-new-trick`
1. Create new Pull Request and explain why your code is trick
