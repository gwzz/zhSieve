require "zhSieve/version"
require "zhSieve/htmlpage"
require "zhSieve/html2md"
require 'mechanize'

module ZhSieve
	BASE_URL = "https://www.zhihu.com"
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
	# BASE_URL = "https://www.zhihu.com"
	# question_id = "43830406"
	# question_uri = "/question/#{question_id}"
	# answer_id = "46959669"
	# answer_uri = "#answer-#{answer_id}"
	# PEOPLE_id = "/people/"
	# LIST_URL = "#{BASE_URL}/question/51727516#answer-46414810"
	# HEADERS_HASH = {"User-Agent" => "Chrome/53.0.2785.143"}

	# arguments = ARGV

	# agent = Mechanize.new
	# agent.user_agent = 'Chrome/53.0.2785.143'
	# agent.max_history = 1
	# Dir.chdir(File.dirname(__FILE__))
	# agent.cookie_jar.load_cookiestxt("../cookies.txt")
	# # search_page = agent.get(BASE_URL+PEOPLE_URL)
	# search_page = agent.get("https://www.zhihu.com#{question_uri}#{answer_uri}")
	# haha = HTMLPage.new(contents:search_page,question_id:question_id,answer_id:answer_id)
end
