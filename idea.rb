#!/usr/bin/env ruby
require 'date'
require 'tempfile'
require 'jekyll'

buf = Tempfile.new(['idea', '.md'])

initial_body = <<-EOF
---
title: My New Idea
author: Thor
status: new|active|completed
---

God hammers don't perform well under skewed workloads, and besides they are insecure...
EOF
buf.write(initial_body)


while true
  buf.rewind
  system("#{ENV["EDITOR"]} #{buf.path}")
  new_body = buf.read

  if new_body =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
      data = SafeYAML.load(Regexp.last_match(1))
      @title = data["title"]
      @status = data["status"]
  end

  if not @title
    puts "Ideas must contain a title in the front matter"
    print "Try again (y/n)? "
    if gets.strip.downcase != "y"
      exit 1
    end
    next
  end

  if not %[new active completed].include? @status
    puts "Ideas must have a status of 'new', 'active', or 'completed'"
    print "Try again (y/n)? "
    if gets.strip.downcase != "y"
      exit 1
    end
    next
  end

  slug = @title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')[..15]
  filename = File.join(__dir__, "_ideas", "#{Date.today}-#{slug}.md")

  File.open(filename, "w") do |f|
    f.write(new_body)
  end
  break
end
