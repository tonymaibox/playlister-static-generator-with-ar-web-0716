class SiteGenerator

	def initialize(path)
		# uses ERB files from app/views
		# _site/"#{path}"/index.html
		# self.all.each do |artist|
		# 	SiteGenerator blah
		@rendered_path = path
	end

	def rendered_path
		@rendered_path
	end

	def build_index
		index = File.new(self)
	end

end