require 'rbprofiler'

RubyVM::InstructionSequence.compile_option = {
  :trace_instruction => true,
  :specialized_instruction => false
}
END {
  RBProfiler.print_profile(STDERR)
}
RBProfiler.start_profile
