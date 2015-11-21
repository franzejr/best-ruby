### Unfreeze objects with fiddle

```ruby
require 'fiddle'

class Object
  # RUBY_FL_FREEZE = (1<<11) http://git.io/v8WEt

  # [         0          ][        1        ]
  #  0 1 2 3  4  5  6   7    8   9   10   11 ...
  #  1 2 4 8 16 32 64 128  256 512 1024 2048 ...
  #                          1   2    4    8 < Zero this bit unconditionally.
  def unfreeze
    Fiddle::Pointer.new(object_id * 2)[1] &= ~8
    self
  end

  alias thaw unfreeze
end

str = 'foo'.freeze
p str.frozen?
str << 'bar' rescue p $!

str.thaw
p str.frozen?
p str << 'bar'

# Result:
# true
# #<RuntimeError: can't modify frozen String>
# false
# "foobar"

```

[View Source](source_code/unfreeze_objects_with_fiddle.rb)

