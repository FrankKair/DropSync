module DropSync
  module Help
    extend self

    def show_message
      puts '--- DropSync ---'
      puts '> To use DropSync you should provide an access_token and a file/folder, like so:'
      puts "\n> Examples:"
      puts '$ dropsync access_token file'
      puts '$ dropsync access_token my_dropbox_folder'
      puts '-------'
    end
  end
end
