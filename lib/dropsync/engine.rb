module DropSync
  class Engine
    def initialize(access_token)
      @client = DropboxApi::Client.new(access_token)
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

    private

    def get_url(path)
      filename = path.split('/').pop
      resp = @client.search(filename, '')
      item_path = ''
      resp.matches.each do |res|
        item_path = res.resource.path_lower if res.resource.path_lower.downcase.include?(path.downcase)
      end

      if item_path.empty?
        puts 'No folder/file path found. Exiting DropSync.'
        exit(0)
      end

      # Check if there's a shared link already
      links = @client.list_shared_links.links
      links.each do |link|
        return link.url if link.path_lower.include?(item_path)
      end

      # Creates new shared link
      link = @client.create_shared_link_with_settings(item_path)
      link.url
    end

    def logout
      @client = nil
      exit(0)
    end
  end
end
