module DropSync
  class Engine
    def initialize(access_token)
      @client = DropboxClient.new(access_token)
    end

    def download(path)
      puts '--- DropSync ---'
      puts "> Searching for #{path}"
      url = get_url(path)
      puts '> Downloading file'
      Auto.download(path, url)
      puts '> Download finished'
      logout
    end

    def upload(_path)
      puts '--- DropSync ---'
      filename = File.basename(path_to_file)
      puts "> Uploading #{filename}"
      @client.put_file(filename, open(path_to_file))
      puts '> Upload finished'
      logout
    end

    private

    def get_url(path)
      filename = path.split('/').pop
      resp = @client.search('/', filename)
      for it in resp
        item_path = it['path'] if it['path'].downcase.include? path.downcase
      end
      @client.shares(item_path)['url']
    end

    def logout
      @client = nil
      exit(0)
    end
  end
end
