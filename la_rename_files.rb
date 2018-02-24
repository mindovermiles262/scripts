#!/usr/bin/env ruby

# Removes unwanted characters and prepends "0" onto any single digit files in a directory
# Usage: 
#     'ruby la_rename_files [PATH]'
#     './la_rename_files [PATH]' (Make sure file has execute permissions)
#
# Flags:
#    -R, --recursive
#        Recursivly search and change directory and file names
#
# Example I/O:
#     '1 - Some Video, Text, or Any %%%% file' => '01-SomeVideoTextorAny----file'

def get_directory
  puts "Enter Directory (ENTER for current directory)"
  printf '> '
  user_input = gets.chomp

  return puts "Goodbye" if %w[e exit q quit].include?(user_input)

  cwd = user_input.empty? ? Dir.pwd : File.expand_path(user_input)
  rename_files(cwd) if File.directory?(cwd)
end

def rename_files(path)
  cwd = File.absolute_path(path)
  puts "Renaming Files in #{cwd}"
  Dir.entries(cwd).each do |file|
    new_file = file.gsub(/\s-\s/, '-').gsub(' ', '').gsub(',', '').gsub('(', '').gsub(')', '').gsub('%', '-')
    new_file = "0#{new_file}" if /^\d{1}-/.match new_file
    File.rename(cwd + "/" + file, cwd + "/" + new_file) if file != new_file
  end
end

def recursive(filename)
  if File.directory?(filename)
    rename_files(filename)
    Dir.chdir(filename)
    Dir.glob('*').each{ |child| recursive(child) }
    Dir.chdir('..')
  end
end

if ARGF.argv[0] == '-R'
  rename_files(Dir.pwd)
  Dir.glob('*').each do |filename|
    recursive(filename)
  end
elsif ARGF.argv.length == 1
  rename_files(ARGF.argv[0]) if ARGF.argv.length == 1
elsif ARGF.argv.length == 0
  get_directory
end
