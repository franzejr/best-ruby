require "irb"

IRB.setup(nil)
IRB.conf[:MAIN_CONTEXT] = IRB::Context.new(IRB::Irb.new)
require "irb/ext/multi-irb"

def run_irb(context=self)
  IRB.irb(nil,context)
end
