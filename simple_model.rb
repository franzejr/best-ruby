class Model
  PROPERTIES = [:id, :name]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(attributes = {})
    attributes.each { |key, value|
      self.send("#{key}=", value) if PROPERTIES.member? key
    }
  end
end

# a_hash = { name: "Somebody", id: 1 }
# @model = Model.new(a_hash)
# @model.name
# => "Somebody"
