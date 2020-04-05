#!/usr/bin/env ruby

# USAGE: ./remove_from_filename.rb [PATH TO FOLDER]
#
# Removes repetative names from files.
#
# '01 - CompTIA Network+ (N10-007) 1.1 and 1.2 Networking Concepts OSI Layers, Ports & Protocols A Tale of Two Kings CBT Nuggets.mp4'
# '02 - CompTIA Network+ (N10-007) 1.1 and 1.2 Networking Concepts OSI Layers, Ports & Protocols The 7 Layers of the OSI Model CBT Nuggets.mp4'
#
# turns into:
#
# '01 - 1.1 and 1.2 OSI Layers, Ports & Protocols A Tale of Two Kings CBT Nuggets.mp4'
# '02 - 1.1 and 1.2 OSI Layers, Ports & Protocols The 7 Layers of the OSI Model CBT Nuggets.mp4'
#
# (Removes "CompTIA Network+ (N10-007)" and "Networking Concepts" from titles)
#

# Words/Phrases to remove from filename
PHRASE_1 = "CompTIA Network+ (N10-007) "
PHRASE_2 = "Networking Concepts "

# Files to be skipped by renaming process
SKIP_FILES = [".", ".."]

if ARGV.length != 1
  puts " ** ERROR! **\n USAGE: ./remove_from_filename.rb [PATH TO FOLDER]"
  exit
end

target_dir = ARGV[0]
files = Dir.entries(target_dir)
cwd = File.absolute_path(target_dir)

files.each do |f|
  next if SKIP_FILES.include?(f)

  new_filename = f.split(PHRASE_1).join()
  new_filename = new_filename.split(PHRASE_2).join()

  old_path = cwd + "/" + f
  new_path = cwd + "/" + new_filename

  File.rename(old_path, new_path)
end

