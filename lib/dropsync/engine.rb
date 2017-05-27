module DropSync
    class Engine
        def initialize(access_token)
            puts '--- DropSync ---'
            @client = DropboxClient.new(access_token)
        end

        def download(path)
            puts "> Searching for #{path}"
            url = get_url(path)
            puts "> Downloading file"
            Mecha.automatic_download(path, url)
            puts '> Download finished!'
            logout
        end

        def upload(path_to_file)
            filename = File.basename(path_to_file)
            puts "> Uploading #{filename}"
            @client.put_file(filename, open(path_to_file))
            puts '> Upload finished!'
        end

        private
        def get_url(path)
            filename = path.split('/').pop
            resp = @client.search('/', filename)

            for it in resp
              if it['path'].downcase.include? path.downcase
                item_path = it['path']
              end
            end

            @client.shares(item_path)['url']
        end

        def logout
            @client = nil
            exit(0)
        end

    end
end
