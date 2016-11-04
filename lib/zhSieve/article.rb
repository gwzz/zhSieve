class Article
	attr_accessor :author,:bio,:avatar,:author_link,:content,:link,:title,:title_image,:published_time

	def initialize
		@author = 'NA'
		@bio = 'NA'
		@avatar = 'NA'
		@link = 'NA'
		@content = 'NA'
		@author_link = 'NA'
		@title = 'NA'
		@title_image = 'NA'
		@published_time = 'NA'
	end

	def format_markdown
		res_file = "## [#{@title}](#{@link})" + "\n"
		res_file += "### "+@avatar + "[#{@author}](" + @author_link + ")"  + "\n"
		res_file += "#### "+ @bio + "\n"
		res_file += "*****\n"
		res_file += @title_image
		res_file += @content
		res_file
	end

end