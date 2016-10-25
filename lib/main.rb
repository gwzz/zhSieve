require 'rubygems'
require 'mechanize'

test_url = "http://google.com"
BASE_URL = "https://www.zhihu.com"
LIST_URL = "#{BASE_URL}/question/51727516#answer-46414810"
HEADERS_HASH = {"User-Agent" => "Chrome/53.0.2785.143"}

agent = Mechanize.new
agent.user_agent = 'Chrome/53.0.2785.143'
agent.max_history = 1
agent.cookie_jar.load_cookiestxt("/Users/zhuwei/studying/open/zhSieve/cookies.txt")

index_page = agent.get(BASE_URL)

index_page.links.each do |link| puts link.text end