desc "Build README.md from source files"
task :build do
  toc    = []
  tricks = []

  File.open("README.md", "w+") do |readme|

    Dir.glob("*.rb").each do |file|
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
2. Create your trick branch: `git checkout -b my-ruby-trick`
3. Commit your changes: `git commit -am 'Add trick'`
4. Push to the branch: `git push origin my-new-trick`
5. Create new Pull Request and explain why your code is trick
}
  end
end
