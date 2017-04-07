require File.expand_path('../dropbox-sdk-ruby-1.6.4/lib/dropbox_sdk', __FILE__)
require './mecha.rb'

class DropSync

    def initialize(access_token)
        @client = DropboxClient.new(access_token)
    end

    def download(filename)
      url = get_url(filename)
      Mecha.automatic_download(url)
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
