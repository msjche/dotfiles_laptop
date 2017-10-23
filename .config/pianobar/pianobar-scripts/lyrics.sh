#!/usr/bin/env ruby

require 'rubygems'
require 'cgi'
require 'active_support/json'

class GetLyrics
  def initialize
    @current_file = ""
    read_current_file
  end

  def read_current_file
    File.open("/tmp/current_song_data", 'r') do |f|
      @current_file = f.gets.strip.gsub(/ - /, ' ')
    end
  end

  def song_query
		obj = ActiveSupport::JSON.decode(@current_file)
		query_string = "#{obj['artist']} #{obj['title']} lyrics"
    CGI.escape(query_string)
  end
end

#system "open 'http://google.com/search?q=#{GetLyrics.new.song_query})&btnI=I%27m+Feeling+Lucky'"
system "open 'http://google.com/search?q=#{GetLyrics.new.song_query}'"
