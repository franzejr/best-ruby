class DontDelegateToMe; end
class DelegateToMe; def delegate; "DelegateToMe" end end

module DelegateIfCan
  def delegate
    if defined? super
      "Modified:  #{super}"
    else
      "DelegateIfCan"
    end
  end
end

p DelegateToMe.new.extend(DelegateIfCan).delegate
p DontDelegateToMe.new.extend(DelegateIfCan).delegate

# Result:
# "Modified:  DelegateToMe"
# "DelegateIfCan"
