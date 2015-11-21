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

[View Source](source_code/single_instance_running.rb)

