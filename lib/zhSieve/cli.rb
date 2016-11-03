require 'thor'
require 'zhSieve'

module ZhSieve
  class CLI < Thor
  desc "version", "Show current version"
	def version
		puts ZhSieve::VERSION
	end

	desc "answer", "Set the question id [Q], answer id [A]"
	option :q, :required => true
	option :a, :required => true
	def answer
		puts ZhSieve.crawl_answer(question_id:options[:q],answer_id:options[:a])
	end

  desc "article", "Set the zhuanlan article id [Z]"
  option :z, :required => true
  def article
    puts ZhSieve.crawl_zl_article(article_id:options[:z])
  end

  end
end