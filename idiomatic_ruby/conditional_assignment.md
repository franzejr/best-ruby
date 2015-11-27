## Conditional assignment
Ruby is heavily influenced by lisp. One piece of obvious inspiration in its
design is that conditional operators return values. This makes assignment based
on conditions quite clean and simple to read.

There are quite a number of conditional operators you can use. Optimize for
readability, maintainability, and concision.

**Before:**
```rb
if some_bool
  string_version = 'yes'
else
  string_version = 'no'
end
```

**After:**

If you're just assigning based on a boolean, the ternary operator works best
(this is not specific to ruby/lisp but still good and in the spirit of the
following examples!).
```rb
string_version = some_bool ? 'yes' : 'no'
```

If you need to perform more complex logic based on a conditional or allow for
\> 2 outcomes, `if`/`elsif`/`else` statements work well.
```rb
retval = if foo
          'foooooo!'
         elsif bar
           'baaaar'
         else
           'dunno'
         end
 ```

If you're assigning based on the value of a single variable, use `case`/`when`
A good barometer is to think if you could represent the assignment in a hash.
For example, in the following example you could look up the value of `opinion`
in a hash that looks like `{"ANGRY" => comfort, "MEH" => ignore ...}`
```rb
action_result = case opinion
                when "ANGRY"
                 comfort
                when "MEH"
                 ignore
                when "HAPPY"
                 high_five
                else
                 ask_opinion
                end
```
