require_relative 'html2md'
module ZhSieve
  class HTMLPage
  include ZhSieve::Converter
    attr_accessor :contents,:question_id,:answer_id

    def initialize(options)
      @contents = options[:contents].body
      @question_id = options[:question_id]
      @answer_id = options[:answer_id]
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
end