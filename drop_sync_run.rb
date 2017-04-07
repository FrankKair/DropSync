#!/usr/bin/env ruby
require './drop_sync.rb'

unless ARGV.count == 2
	puts "Enter your access token and filename"
	raise "Wrong input arguments"
end

access_token, filename = ARGV[0], ARGV[1]

dropSync = DropSync.new(access_token)
dropSync.download(filename)