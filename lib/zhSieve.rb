require 'rubygems'
require 'mechanize'
require_relative "support/support"
require_relative "support/htmlpage"
require_relative "support/html2md"

if ARGV.length < 1
  puts "Too few arguments"
  exit
end

class SearchOption
	def initialize(alist)
		if alist.find { |e| /q/ =~ e }
			@qid = alist.find { |e| /q/ =~ e }.gsub('q:','')
		end
		if alist.find { |e| /a/ =~ e }
			@aid = alist.find { |e| /a/ =~ e }.gsub('a:','')
		end
	end
	def questionid
		@qid
	end
	def answerid
		@aid
	end
end

# set base information usded to connect
BASE_URL = "https://www.zhihu.com"
QUESTION_URL = "/question/51816561"
ANSWER_URL = ""
PEOPLE_URL = "/people/gwzz"
LIST_URL = "#{BASE_URL}/question/51727516#answer-46414810"
HEADERS_HASH = {"User-Agent" => "Chrome/53.0.2785.143"}

arguments = ARGV



search_opt = SearchOption.new(arguments)

agent = Mechanize.new
agent.user_agent = 'Chrome/53.0.2785.143'
agent.max_history = 1
agent.cookie_jar.load_cookiestxt("../cookies.txt")
search_page = agent.get(BASE_URL+PEOPLE_URL)
# search_page.links.each do |link| puts link.text end
# testcontent = search_page.at_css('.zu-main-content , #zh-question-answer-wrap .clearfix')
haha = HTMLPage.new(contents:search_page)
peopleContent = haha.peopleMarkdown
hahahtml = haha.to_html
File.open("/Users/zhuwei/studying/open/zhSieve/testfile/people.html", "a+") do |w|
    w.puts(hahahtml)
end


File.open("/Users/zhuwei/studying/open/zhSieve/testfile/people.md", "a+") do |w|
    w.puts(haha.peopleMarkdown)
end

