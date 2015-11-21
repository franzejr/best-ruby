"1".next
#=> "2"

"a".next
#=> "b"

"1a".next
#=> "1b"

"1z".next
#=> "2a"

"1aa".next
#=> "1ab"

"1az".next
#=> "1ba"

"1aaz".next
#=> "1aba"
