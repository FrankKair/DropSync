#!/usr/bin/env ruby
require './engine.rb'

unless ARGV.count == 2
	puts "Enter your access token and filename"
	raise "Wrong input arguments"
end

access_token, filename = ARGV[0], ARGV[1]

drop_sync = Engine.new(access_token)
drop_sync.download(filename)