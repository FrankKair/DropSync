require 'dropbox_sdk'
require './mecha.rb'

class Engine

    def initialize(access_token)
        puts '--- DropSync ---'
        @client = DropboxClient.new(access_token)
    end

    def download(filename)
        puts "> Searching for #{filename}"
        url = get_url(filename)
        puts '> Downloading file'
        Mecha.automatic_download(filename, url)
        puts '> Download finished!'
        logout
    end

    private
    def get_url(filename)
        resp = @client.search('/', clean_up(filename))
        for item in resp
            path = item['path']
        end
        @client.shares(path)['url']
    end

    def logout
        @client = nil
        exit(0)
    end

    def clean_up(str)
        return str.gsub(/^\/+/, '') if str
        str
    end
end
