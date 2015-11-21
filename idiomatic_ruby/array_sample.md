## Array Sample (enumerables)

To get a random element from an Array, you can use the method sample, as follows:

```ruby
[1, 2, 3][rand(3)]

[1, 2, 3].shuffle.first

[1, 2, 3].sample
```

``sample`` is 15x faster than ``.shuffle.first`` 

Reference:
http://work.stevegrossi.com/2014/10/25/writing-fast-and-idiomatic-ruby/
