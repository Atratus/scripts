#!/usr/bin/env ruby
# encoding: utf-8

# clears all apache log files

require 'fileutils'
require 'term/ansicolor'
require 'slop'

class String
  include Term::ANSIColor
end

if __FILE__ == $0
  dir = '/opt/local/apache2/logs'
  
  FileUtils.cd(dir, :verbose => nil)
  
  files_do_truncate = Dir.glob("*_log")
  
  files_do_truncate.each do |file_to_truncate|
    
    begin
      File.truncate(file_to_truncate, 0)
      puts 'truncated '.green + file_to_truncate
    rescue Exception => e
      puts 'unable to clear '.red + file_to_truncate + ' ' + e.message.red
    end
    
  end
  
end
