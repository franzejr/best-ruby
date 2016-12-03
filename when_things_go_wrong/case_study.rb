Application = Struct.new(:state)

class User
  def initialize
    @applications = []
  end

  attr_reader :applications

  def can_renew?
    return false if applications.empty?
    applications.all? { |e| [:accepted, :rejected].include?(e.state) }
  end
end

require "test/unit"

class UserTest < Test::Unit::TestCase

  def setup
    @gregory = User.new
  end

  def test_a_new_applicant_cannot_renew
    assert_block("Expected User#can_renew? to be false for a new applicant") do
      not @gregory.can_renew?
    end
  end

  def test_a_user_with_pending_applications_cannot_renew
    @gregory.applications << app(:accepted) << app(:pending)

    msg = "Expected User#can_renew? to be false when user has pending applications"
    assert_block(msg) do
      not @gregory.can_renew?
    end
  end

  def test_a_user_with_only_accepted_and_rejected_applications_can_renew
    @gregory.applications << app(:accepted) << app(:rejected) << app(:accepted)
    msg = "Expected User#can_renew? to be true when all applications are accepted or rejected"
    assert_block(msg) { @gregory.can_renew? }
  end

  private

  def app(name)
    Application.new(name)
  end

end
