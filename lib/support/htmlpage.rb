require_relative 'html2md'

class HTMLPage
  include HTML2Markdown::Converter
  attr_accessor :contents,:question_id,:answer_id

  def initialize(options)
    # doc = Nokogiri::HTML(options[:contents].body, 'UTF-8')
    @contents = options[:contents].body
    @question_id = options[:question_id]
    @answer_id = options[:answer_id]
    # puts @contents.css(".title-section .name")
    # File.open("/Users/zhuwei/studying/open/zhSieve/testfile/people.html", "a+") do |w|
    #   w.puts(@contents)
    # end
  end

  def peopleMarkdown
    @markdown = people_to_markdown(@contents)
  end

  def answerMarkdown
    @markdown = answer_to_markdown(@contents,@question_id,@answer_id)
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
