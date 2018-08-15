#!/usr/bin/env ruby

cwd = Dir.pwd

Dir.glob('*').each do |file|
  new_file_name = file
  vid_extension = file[-4..-1]
  core_str = /CCNA_200-120_-_.+?(?=84)/.match(file).to_s
  if core_str.length > 5
    vid_number = /_\d+_/.match(core_str).to_s[1..-2]
    vid_title = /.+?(?=_\d+_)/.match(core_str).to_s[15..-1]
    new_file_name = "#{vid_number}-#{vid_title}#{vid_extension}"
  else
    core_str = /CCNA_CCENT_200-120_-_.+?(?=84)/.match(file).to_s
    if core_str.length > 5
      vid_number = /_\d+_/.match(core_str).to_s[1..-2]
      vid_title = /.+?(?=_\d+_)/.match(core_str).to_s[21..-1]
      new_file_name = "#{vid_number}-#{vid_title}#{vid_extension}"
    end
  end

  if not new_file_name[0..1] == '-.'
    File.rename(cwd + '/' + file, cwd + '/' + new_file_name)
  end
end

