# encoding UTF-8

module Kernel
  alias_method :λ, :lambda
end

l = λ { p :called }
l.call

# Result:
# :called
