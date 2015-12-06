## Refactoring switch case with Hashes

The author presents a simple refactoring from case statement to hash table, as an ode to Ruby's "little things".
Ruby owes its popularity to an abundance of “little things”–small touches in just the right places that make all of its features come together in delightful ways. One of those little things, for me, is the humble Hash class.

Hashes are one of the most versatile data structures in Ruby. I’ve written about them before, regarding their interchangability with Proc objects, but there’s so much more they can do.

I was recently doing a code review and encountered a pattern where user input was being used to derive a class to instantiate. It looked something like this. (Note that this is not the actual code, and is not even the same use-case. I’ve taken some liberties here.)

```ruby
case params[:student_level]
when :freshman, :sophomore then
  student = Student::Underclassman.new(name, birthdate,
    address, phone)
when :junior, :senior then
  student = Student::Upperclassman.new(name, birthdate,
    address, phone)
when :graduate
  student = Student::Graduate.new(name, birthdate,
    address, phone)
else
  student = Student::Unregistered.new(name, birthdate,
    address, phone)
end
```

I have no doubt that many of you reading this will take one look at that code and think of half a dozen ways in which it might be refactored. (In fact, I was a bit reluctant to write this article, for fear that folks might bike-shed over the best way to refactor my example here. I did it anyway. :))

Looking at the code, my first impression was that the case statement was merely selecting a different class based on the value of the user input. We could easily refactor it (for a slight improvement in clarity) like this:

```ruby
klass = case params[:student_level]
  when :freshman, :sophomore then
    Student::Underclassman
  when :junior, :senior then
    Student::Upperclassman
  when :graduate
    Student::Graduate
  else
    Student::Unregistered
  end
student = klass.new(name, birthdate, address, phone)
```

Right? And when I see a case statement being used simply to select between different values given some input, I find myself itching to rewrite it using a hash. Because, really, what is a hash, except a mapping that selects between different values, given some input?

This is the pattern I proposed in the code review:

```ruby
STUDENT_LEVELS = Hash.new(Student::Unregistered).merge(
    freshman:  Student::Underclassman,
    sophomore: Student::Underclassman,
    junior:    Student::Upperclassman,
    senior:    Student::Upperclassman,
    graduate:  Student::Graduate
  )

klass = STUDENT_LEVELS[params[:student_level]]
student = klass.new(name, birthdate, address, phone)
```

It takes advantage of Hash.new(default_value) to ensure that Student::Unregistered is always what we get for any unrecognized input, and then Hash#merge adds in the specific mappings.

The beauty of this, to me, is that the class-selection logic is now separate from the class-instantiation logic. The mapping itself can be declared outside the method, reducing clutter. That leaves us with just the two lines in the method itself: fetching the class to instantiate, and instantiating it. Easy to read, easy to test, and easy to maintain.

Win, win, and win!

[From](http://weblog.jamisbuck.org/2015/11/14/little-things-refactoring-with-hashes.html)
