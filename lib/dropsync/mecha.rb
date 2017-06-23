require 'mechanize'
require 'fileutils'

module DropSync
    class Mecha
        def self.automatic_download(path, url)
            agent = Mechanize.new do |agent|
                agent.user_agent_alias = 'Mac Safari'
            end

            # Gets download link
            page = agent.get(url)
            link = page.uri.to_s.gsub('dl=0', 'dl=1')

            # Creates directory
            download_path = "#{File.expand_path('~')}/Downloads"
            FileUtils.cd(download_path)
            path.split('/').each do |d|
                begin
                    FileUtils.mkdir(d)
                rescue
                    puts "> Directory '#{d}' already exists"
                    FileUtils.rm_rf(d)
                    FileUtils.mkdir(d)
                end
                FileUtils.cd(d)
            end
            filename = path.split('/').pop

            # Download
            system("curl -L -s -o #{download_path}/#{path}/#{filename}.zip #{link}")
            system("unzip #{download_path}/#{path}/#{filename}.zip > /dev/null 2>&1")

            # Cleans directory
            FileUtils.rm_rf("__MACOSX")
            FileUtils.rm_rf("#{filename}.zip")
        end
    end
end