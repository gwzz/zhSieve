require 'thor'
require 'zhSieve'

module ZhSieve
  class CLI < Thor
  	desc "portray ITEM", "Determines if a player is good or not"
	def portray(name)
		puts ZhSieve::HTMLPage.portray(name)
	end
  end
end