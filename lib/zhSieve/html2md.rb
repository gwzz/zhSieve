require 'nokogiri'
require 'json'
require_relative 'people'
require_relative 'answer'
require_relative 'article'

module ZhSieve
  module Converter
    def to_markdown string_contents
      raise NoContents unless string_contents!=nil 
      doc = Nokogiri::HTML(string_contents,'UTF-8')
      doc.children.map { |ele| parse_element(ele) }.join
    end

    def people_to_markdown string_contents
      raise NoContents unless string_contents!=nil 
      doc = Nokogiri::HTML(string_contents,'UTF-8')
      search_user = People.new
      # set people info
    end

    def answer_to_markdown string_contents,question_id,answer_id
      raise NoContents unless string_contents!=nil
      doc = Nokogiri::HTML(string_contents,'UTF-8')
      answer_node = doc.search '[data-aid="'+answer_id.to_s+'"]'
      search_answer = Answer.new
      # search and set question infomations
      avatar_raw = answer_node.search '[class="zm-list-avatar avatar"]'
      author_raw = answer_node.search '[class="author-link"]'
      bio_raw = answer_node.search '[class="bio"]'
      content_raw = answer_node.search '[class="zm-editable-content clearfix"]'
      search_answer.question = doc.title.strip
      search_answer.link = "https://www.zhihu.com/people/#{question_id}#answer-#{answer_id}"
      search_answer.avatar= parse_element(avatar_raw.first)
      search_answer.bio = parse_element(bio_raw.first)
      search_answer.content = parse_element(content_raw.first)
      author_info = parse_element(author_raw.first).split(/[\[\]\(\)]/)
      search_answer.author = author_info[1]
      search_answer.author_link = "https://www.zhihu.com" + author_info[3]
      markdown_text = search_answer.format_markdown
    end

    def article_to_markdown string_contents,article_id
      raise NoContents unless string_contents!=nil
      doc_hash = JSON.parse(string_contents)
      search_article = Article.new
      search_article.title = doc_hash["title"]
      search_article.title_image = "![](#{doc_hash["titleImage"]})"
      search_article.published_time = doc_hash['publishedTime']
      search_article.link = "https://zhuanlan.zhihu.com/p/#{article_id}"
      search_article.content = doc_hash["content"]
      search_article.author = doc_hash["author"]["name"]
      search_article.bio = doc_hash["author"]["bio"] || "No Bio!"
      search_article.author_link = doc_hash["author"]["profileUrl"]
      avatar_template = doc_hash["author"]["avatar"]["template"].gsub('{size}','s')
      avatar_id = doc_hash["author"]["avatar"]["id"]
      avatar_uri = avatar_template.gsub('{id}', "#{avatar_id}")
      search_article.avatar = "![](#{avatar_uri})"
      markdown_text = search_article.format_markdown
    end

    def parse_element(ele)
      if ele.is_a? Nokogiri::XML::Text
        return "#{ele.text}\n"
      else
        if (children = ele.children).count > 0 
          return wrap_node(ele,children.map {|ele| parse_element(ele)}.join )
        else
          return wrap_node(ele,ele.text)
        end
      end
    end

    # wrap node with markdown
    def wrap_node(node,contents=nil)
      result = ''
      contents.strip! unless contents==nil
      # check if there is a custom parse exist
      if respond_to? "parse_#{node.name}"
        return self.send("parse_#{node.name}",node,contents)
      end
      # skip hidden node
      return '' if node['style'] and node['style'] =~ /display:\s*none/
      # default parse
      case node.name.downcase
      when 'i'
      when 'script'
      when 'style'
      when 'li'
        result << "*#{contents}\n"
      when 'blockquote'
        contents.split('\n').each do |part|
          result << ">#{contents}\n"
        end
      when 'p'
        result << "\n#{contents}\n"
      when 'strong'
        result << "**#{contents}**\n"
      when 'h1'
        result << "# #{contents}\n"
      when 'h2'
        result << "## #{contents}\n"
      when 'h3'
        result << "### #{contents}\n"
      when 'hr'
        result << "****\n"
      when 'br'
        result << "\n"
      when 'img'
        result << "![#{node['alt']}](#{node['src']})"
      when 'a'
        result << "[#{contents}](#{node['href']})"
      else
        result << contents unless contents == nil
      end
      result
    end

    # define custom node processor
    def method_missing(name,*args,&block)
      self.class.send :define_method,"parse_#{name}" do |node,contents|
        block.call node,contents
      end
    end

    def debug
      puts '----------------------------------'
      puts yield
      puts '----------------------------------'
    end

  end

  class NoContents < Exception;end
end
