#!/usr/bin/env ruby
require './drop_sync.rb'

raise "No app_key / app_secret" unless !ARGV.empty?
app_key, app_secret, filename = ARGV[0], ARGV[1], ARGV[2]
drop = DropSync.new(app_key, app_secret)
drop.start(filename)