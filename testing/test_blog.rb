require "builder"     
require "ostruct"

class Blog < OpenStruct             

  def entries
    @entries ||= []
  end                  

  def to_rss
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.rss version: "2.0" do
      xml.channel do
        xml.title       title
        xml.link        "http://#{domain}/"
        xml.description  description
        xml.language    "en-us"

        @entries.each do |entry|
          xml.item do
            xml.title       entry.title
            xml.description entry.description
            xml.author      author
            xml.pubDate     entry.published_date
            xml.link        entry.url
            xml.guid        entry.url
          end
        end
      end
    end
  end    
           
end  

require "test/unit"
require "test_unit_extensions"

require "time"
require "nokogiri"

class BlogTest < Test::Unit::TestCase

  def setup
    @blog = Blog.new
    @blog.title       = "Awesome"
    @blog.domain      = "majesticseacreature.com"   
    @blog.description = "Totally awesome"      
    @blog.author      = "Gregory Brown"
  
    entry = OpenStruct.new
    entry.title          = "First Post"
    entry.description    = "Nothing interesting"   
    entry.published_date = Time.parse("08/08/2008") 
    entry.url            = "http://majesticseacreature.com/awesome.html" 
  
    @blog.entries << entry  
    @feed = Nokogiri::XML(@blog.to_rss)
  end

  must "be RSS v 2.0" do 
     assert_equal "2.0", @feed.at("rss")["version"]
  end

  must "have a title of Awesome" do
    assert_equal "Awesome", text_at("rss","title")
  end

  must "have a description of Totally Awesome" do
    assert_equal "Totally awesome", text_at("rss", "description")
  end

  must "have an author of Gregory Brown" do
    assert_equal "Gregory Brown", text_at("rss", "author")
  end

  must "have an entry with the title: First Post" do
    assert_equal "First Post", text_at("item", "title")
  end

  def text_at(*args)
    args.inject(@feed) { |s,r| s.send(:at, r) }.inner_text
  end
     
end
