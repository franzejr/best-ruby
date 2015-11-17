require './lib/contributor'

desc "Build README.md from source files"
task :build do
  toc    = []
  tricks = []

  File.open("README.md", "w+") do |readme|

    Dir.glob("*.rb").sort.each do |file|
      filename = File.basename file
      heading  = File.basename(file, ".rb").tr("_", " ").capitalize
      link     = heading.tr(" ", "-").downcase
      content  = File.read file

      # Add link to table on contents
      toc << "[#{heading}](##{link})"

      # Add trick file contents to array of tricks
      tricks << %{### #{heading}

```ruby
#{content}
```

[View Source](#{filename})

}
    end

    # Render intro
    readme.puts %{# Ruby Tricks

[![Join the chat at https://gitter.im/franzejr/ruby-tricks](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/franzejr/ruby-tricks?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

The majority of these Ruby Tricks were extracted from James Edward Gray II [talk](https://www.youtube.com/watch?v=aBgnlBoIkVM).
If you know some other tricks, please contribute!

}

    # Render table of contents
    readme.puts "## Table of Contents"
    readme.puts "\n"
    toc.each do |link|
      readme.puts "- #{link}"
    end
    readme.puts "\n"

    # Render tricks
    readme.puts "## Tricks"
    readme.puts "\n"
    tricks.each do |trick|
      readme.puts trick
    end

    # Render contributors
    readme.puts File.read "CONTRIBUTORS.md"
    readme.puts "\n"

    # Render contributing instructions
    readme.puts %{## Contributing

1. Fork it
1. Create your trick branch: `git checkout -b my-ruby-trick`
1. Add your trick to the collection of `.rb` files
1. Regenerate `README.md`: `rake build` (install Rake with `bundle`)
1. Commit your changes: `git commit -am 'Add trick'`
1. Push to the branch: `git push origin my-new-trick`
1. Create new Pull Request and explain why your code is trick
}
  end
end

desc 'Adds the given name a contributor'
task :add_contributor do |t, args|
  contributor = ARGV[1]
  raise ArgumentError, 'Contributor name is required' if contributor.nil?
  Contributor.new(contributor).add
  Rake::Task['build'].execute
  puts "#{contributor} was added as a contributor"
  exit
end
