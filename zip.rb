letters = "a".."d"
numbers = 1..3

letters.zip(numbers) do |letter, number|
  p(letter: letter, number: number)
end
