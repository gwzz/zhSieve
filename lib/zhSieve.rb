require "zhSieve/version"
require "zhSieve/htmlpage"
require "zhSieve/html2md"
require 'mechanize'

module ZhSieve
	BASE_URL = "https://www.zhihu.com"
	ZL_URI = "https://zhuanlan.zhihu.com/api/posts/"
	def self.crawl_answer(options)
		question_id = "#{options[:question_id]}"
		question_uri = "/question/#{question_id}"
		answer_id = "#{options[:answer_id]}"
		answer_uri = "#answer-#{answer_id}"
		search_uri = "#{BASE_URL}#{question_uri}#{answer_uri}"
		agent = Mechanize.new
		agent.user_agent = 'Chrome/53.0.2785.143'
		agent.max_history = 1
		# Dir.chdir(File.dirname(__FILE__))
		agent.cookie_jar.load_cookiestxt("./cookies.txt")
		search_page = agent.get("#{search_uri}")
		haha = HTMLPage.new(contents:search_page,question_id:question_id,answer_id:answer_id).answerMarkdown
	end

	def self.crawl_zl_people(options)

	end

	def self.crawl_zl_article(options)
		article_id = "#{options[:article_id]}"
		search_uri = "#{ZL_URI}#{article_id}"
		agent = Mechanize.new
		agent.user_agent = 'Chrome/53.0.2785.143'
		agent.max_history = 1
		# Dir.chdir(File.dirname(__FILE__))
		agent.cookie_jar.load_cookiestxt("./cookies.txt")
		search_page = agent.get("#{search_uri}")
		haha = HTMLPage.new(contents:search_page,article_id:article_id).articleMarkdown
	end

end
