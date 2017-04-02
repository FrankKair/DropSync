#!/usr/bin/env ruby
require './drop_sync.rb'

unless ARGV.count == 3
	puts "Enter your app_key, app_secret and filename"
	raise "Wrong input arguments"
end

app_key, app_secret, filename = ARGV[0], ARGV[1], ARGV[2]

drop = DropSync.new(app_key, app_secret)
drop.start(filename)