require File.expand_path('../dropbox-sdk-ruby-1.6.4/lib/dropbox_sdk', __FILE__)

class DropSync

    def initialize(app_key, app_secret)
        login(app_key, app_secret)
    end

    def start(filename)
        download(filename)
    end

    private
    def login(app_key, app_secret)
        web_auth = DropboxOAuth2FlowNoRedirect.new(app_key, app_secret)
        authorize_url = web_auth.start()
        system("open", authorize_url)
        print "Enter the authorization code here: "
        STDOUT.flush
        auth_code = STDIN.gets.strip
        access_token, user_id = web_auth.finish(auth_code)
        @client = DropboxClient.new(access_token)
    end

    def download(filename)
        resp = @client.search('/',clean_up(filename))
        for item in resp
            path = item['path']
        end
        url = @client.shares(path)['url']
        system("open", url)
        logout
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
