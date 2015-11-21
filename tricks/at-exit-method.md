### At exit method

```ruby
#Basic use
puts 'script start'
at_exit do
  puts 'inside at_exit method for the first time'
end

#anywhere in your code again
at_exit do
  puts 'inside at_exit method for the second time'
end
puts "script end"

#Result:
#script start
#script end
#inside at_exit method for the second time
#inside at_exit method for the first time


#Own exception crash logger
at_exit do
  if $! # If the program exits due to an exception
    puts 'Exiting'

    #you can also print log to a file
    #you can send notification to another app
  end
end



#Logging error anywhere when program exit

(Thread.current[:errors] ||= []) << 'Any error message goes here'
#or
def log_error(error_message)
  (Thread.current[:errors] ||= []) << "#{error_message}"
end

#Now, log all the errors
at_exit do
  File.open('errors.txt', 'a') do |file|
    (Thread.current[:errors] ||= []).each do |error|
      file.puts error
    end
  end
end
```

[View Source](source_code/at_exit_method.rb)

