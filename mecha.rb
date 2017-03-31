require 'mechanize'

class Mecha

	def self.automatic_download(url)
		agent = Mechanize.new do |agent|
			agent.user_agent_alias = 'Mac Safari'
		end

		page = agent.get(url)
		link = page.uri.to_s.gsub('dl=0', 'dl=1')
		system("open", link)
	end

end
