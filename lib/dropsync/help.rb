module DropSync
	module Help
		extend self

		def show_message
			puts '--- DropSync ---'
			puts '> To use DropSync you should provide an access_token, a command and a file, like so:'
			puts '$ dropsync access_token command file'
			puts "\n> Commands:"
			puts "> download argument -> file/folder"
			puts "> upload argument -> path to file"
			puts "\n> Examples:"
			puts "$ dropsync access_token download my_dropbox_folder"
			puts "$ dropsync access_token upload ~/Desktop/my_stuff/my_file.txt"
			puts "-------"
		end

		def invalid_command
			puts '--- DropSync ---'
			puts '> Please enter a valid command: download or upload'
			puts '> Need help?'
			puts '$ dropsync help'
			puts '-------'
		end

	end
end