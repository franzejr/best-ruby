DATA.flock(File::LOCK_EX | File::LOCK_NB) or abort 'Already running'

trap('INT', 'EXIT')
puts 'Running...'
loop do
  sleep
end

__END__
DO NOT DELETE: used for locking
