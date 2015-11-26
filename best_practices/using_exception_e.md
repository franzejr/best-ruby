## rescue => Exception e

Let’s say you want to capture exception details, like in the following example:

**Problem:**

```ruby
def do_something!
  # ... do something ...
  success
rescue Exception => e
  failed e
end
```

[Example](https://gist.github.com/rafaelsales/1067532247934508e455#file-non-stopper-rb):

```ruby
loop do
  begin
    sleep 1
  rescue Exception => e
    puts "I'm STRONGER. Give up!"
  end
end
# Run and try CTRL+C
```

Using ``Exception => e`` we are allowing ALL the Exception types, as you can see above:

```
Exception
 NoMemoryError
 ScriptError
   LoadError
   NotImplementedError
   SyntaxError
 SignalException
   Interrupt
 StandardError
   ArgumentError
   IOError
     EOFError
   IndexError
   LocalJumpError
   NameError
     NoMethodError
   RangeError
     FloatDomainError
   RegexpError
   RuntimeError
   SecurityError
   SystemCallError
   SystemStackError
   ThreadError
   TypeError
   ZeroDivisionError
 SystemExit
 fatal
```

**Solution:**

What to do instead? Start using rescue => e as it’s the same for rescue StandardError => e and is almost certainly the broadest type of Exception that we want to rescue.

```ruby
def do_something!
  # ... do something ...
  success
rescue => e
  failed e
end
```

Interesting Links:

- http://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby
- http://daniel.fone.net.nz/blog/2013/05/28/why-you-should-never-rescue-exception-in-ruby/
- https://robots.thoughtbot.com/rescue-standarderror-not-exception
