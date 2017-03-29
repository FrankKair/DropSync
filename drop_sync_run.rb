#!/usr/bin/env ruby
require './drop_sync.rb'

raise "No app_key / app_secret" unless !ARGV.empty?
drop = DropSync.new ARGV[0], ARGV[1]
drop.start