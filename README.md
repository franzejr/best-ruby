# Ruby Tricks, Idiomatic Ruby, Refactorings and Best Practices

> Do you know why experienced Ruby programmers tend to reach for basic collections
> and hashes while programmers from other languages go for more specialized classes?
> Do you know the difference between strip, chop, and chomp; and why there are three
> such similar methods when apparently one might suffice (Not to mention lstrip and
> rstrip!)? Do you know the downsides of dynamic typing? Do you know why the differences
> between strings and symbols get so blurry, even to experienced Ruby developers?
> How about metaprogramming? What the heck is an eigenclass? How about
> protected methods? Do you know what they’re really about? Really? Are you sure?
[Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104)

> Absolutely the best way to learn to write idiomatic Ruby code is to read idiomatic Ruby code. [Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104)

This repository aims to help everyone write more idiomatic, clean, and tricky ruby code and also document good refactoring techniques. You can add your own technique or paste it from some website. Do not forget the source, of course. All the tricks are in the /tricks folder.

For the sake of clarity, you should paste in the markdown format. At the end, if the code is not your own, paste a reference to the author and source of the technique.

## [Tricks](tricks.md)

In this part we can review some obscure or awesome features from the and the standard ruby library which we normally forget.

## [Idiomatic Ruby](idiomatic_ruby.md)

You can write Ruby code, but it can sometimes look like Java code. Here you can find some tips to write more naturally and take advantage of idiomatic Ruby.

## [Refactorings](refactorings.md)

Small (and big) improvements you can apply to your code and improve it's readability and maintenance. Change the internal structure of the code without changing it's behaviour.

## [Best Practices](best_practices.md)

If you keep your house cleaned constantly you'll never need to waste a weekend cleaning it. The same applies to your code. Be disciplined and keep your code looking good with those tips.

## Contributors

A big thanks to the following [people](https://github.com/franzejr/best-ruby/graphs/contributors)

## Contributing

1. [Fork it](https://github.com/franzejr/best-ruby)
2. Create a branch with your idea: `git checkout -b my-idea`
3. Check in which category it should be: best practice, idiomatic ruby, refactorying or trick. If you don't know, please open an issue and ask.
4. Add your idea to the collection of `.md` files in the correct folder (tricks, refactorings, idiomatic_ruby or best_practices) folder
5. Commit your changes: `git commit -am 'Add my idea'`
6. Push to the branch: `git push origin my-idea`
7. Create a new Pull Request and explain your technique in the markdown file
