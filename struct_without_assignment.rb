Struct.new("Name", :first, :last) do
  def full
    "#{first} #{last}"
  end
end

franzejr = Struct::Name.new("Franze", "Jr")
p franzejr.full

# Result:
# "Franze Jr"
