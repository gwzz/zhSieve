require_relative 'html2md'
require_relative 'people'
class HTMLPage
  include HTML2Markdown::Converter
  attr_accessor :contents

  def initialize(options)
    doc = Nokogiri::HTML(options[:contents].body, 'UTF-8')
    @contents = options[:contents].body
    # puts @contents.css(".title-section .name")
    # File.open("/Users/zhuwei/studying/open/zhSieve/testfile/people.html", "a+") do |w|
    #   w.puts(@contents)
    # end
  end

  def peopleMarkdown
    @markdown = people_to_markdown(@contents)
  end

  def to_html
    @html =  @contents
  end

  def markdown
    @markdown ||= markdown!
  end

  def markdown!
    @markdown = to_markdown(@contents)
  end

end
