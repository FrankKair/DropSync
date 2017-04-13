require 'mechanize'
require 'fileutils'

module DropSync
  class Mecha

  	def self.automatic_download(filename, url)
  		agent = Mechanize.new do |agent|
  			agent.user_agent_alias = 'Mac Safari'
  		end

  		page = agent.get(url)
  		link = page.uri.to_s.gsub('dl=0', 'dl=1')
  		download_path = "#{File.expand_path('~')}/Downloads"
  		system("curl -L -s -o #{download_path}/#{filename}.zip #{link}")
  	end

  end
end