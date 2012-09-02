#!/usr/bin/env ruby

# displays all hosts from ssh config file

counter = 1
File.open(ENV['HOME']+"/.ssh/config", "r") do |infile|
  while (line = infile.gets)
    if line.include? 'host '
      b = (counter < 10 ? " " : "")
      puts b + "#{counter}: #{line}"
      counter += 1
    end
  end
end