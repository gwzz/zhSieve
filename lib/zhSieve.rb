require "zhSieve/version"
require "zhSieve/htmlpage"
require "zhSieve/html2md"
require 'mechanize'

module ZhSieve
	# BASE_URL = "https://www.zhihu.com"
	# QUESTION_ID = "43830406"
	# QUESTION_URI = "/question/#{QUESTION_ID}"
	# ANSWER_ID = "46959669"
	# ANSWER_URI = "#answer-#{ANSWER_ID}"
	# PEOPLE_ID = "/people/"
	# LIST_URL = "#{BASE_URL}/question/51727516#answer-46414810"
	# HEADERS_HASH = {"User-Agent" => "Chrome/53.0.2785.143"}

	# arguments = ARGV

	# agent = Mechanize.new
	# agent.user_agent = 'Chrome/53.0.2785.143'
	# agent.max_history = 1
	# Dir.chdir(File.dirname(__FILE__))
	# agent.cookie_jar.load_cookiestxt("../cookies.txt")
	# # search_page = agent.get(BASE_URL+PEOPLE_URL)
	# search_page = agent.get("https://www.zhihu.com#{QUESTION_URI}#{ANSWER_URI}")
	# haha = HTMLPage.new(contents:search_page,question_id:QUESTION_ID,answer_id:ANSWER_ID)
end
