SCRIPT_LINES__ = { }

#require_relative = 'better_be_well_formed_code'
require_relative = 'better_be_well_formed_code_with_a_line_size_greather_than_80_it_is_not_good'

if SCRIPT_LINES__.values.flatten.any? { |line| line.size > 80}
  abort 'Clean up your code first!'
end
