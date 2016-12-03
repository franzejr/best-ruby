require "pstore"

class User

  def self.data
    @data ||= PStore.new("users.store")
  end

  def self.add(id, user_data)
    data.transaction do
      data[id] = user_data
    end
  end

  def self.find(id)
    data.transaction do
      data[id] or raise "User not found"
    end
  end
 
  def initialize(id)
    @user_id = id
  end

  def attributes
    self.class.find(@user_id)
  end

  def first_name
    attributes[:first_name]
  end

end
