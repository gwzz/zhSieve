class Answer
	attr_accessor :author,:bio,:avatar,:author_link,:content,:question,:link

	def initialize
		@author = 'NA'
		@bio = 'NA'
		@avatar = 'NA'
		@link = 'NA'
		@content = 'NA'
		@question = 'NA'
		@author_link = 'NA'
	end

	def format_markdown
		res_file = "## " + "[#{@question}](" + @link + ")" + "\n"
		res_file += "### "+@avatar + "[#{@author}](" + @author_link + ")"  + "\n"
		res_file += "#### "+@bio + "\n"
		res_file += "*****\n"
		res_file += @content
		res_file
	end

end