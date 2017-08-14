## Collect vs Select

collect : Creates a new array containing the values returned by the block.

```ruby
arr = (1..10).to_a
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.collect{ |num| num * num }
# => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

select : Elements can be selected from an array according to criteria defined in a block.

```ruby
arr = (1..10).to_a
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select(&:even?)
# => [2, 4, 6, 8, 10]
```
