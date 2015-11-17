class Contributor
  def initialize(contributor)
    @contributor = contributor
  end

  def add
    File.open('CONTRIBUTORS.md', 'a+') do |f|
      f.puts "- [@#{@contributor}](https://github.com/#{@contributor})"
    end
  end
end
