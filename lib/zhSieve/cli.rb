require 'thor'
require 'zhSieve'

module ZhSieve
  class CLI < Thor
  	desc "version", "Show current version"
	def version
		puts ZhSieve::VERSION
	end
  end
end