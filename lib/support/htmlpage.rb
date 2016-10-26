require_relative 'html2md'

class HTMLPage
  include HTML2Markdown::Converter
  attr_accessor :contents

  def initialize(options)
    doc = Nokogiri::HTML(options[:contents].body, 'UTF-8')
    @contents = doc.to_s
  end

  def markdown
    puts @contents
    @markdown ||= markdown!
  end

  def markdown!
    @markdown = to_markdown(@contents)
  end

end
