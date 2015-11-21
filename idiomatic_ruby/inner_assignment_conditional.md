## Inner assignment inside conditional

**Before:**

```ruby
if vals.any?
  retval = do_something(vals)
else
  retval = do_something_different
end
```

**After:**

```ruby
retval = if vals.any?
           do_something(vals)
         else
           do_something_different
         end
```
