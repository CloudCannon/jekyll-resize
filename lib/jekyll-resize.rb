require 'digest'

module Jekyll
  module Resize
    def resize(source, options)
      site = @context.registers[:site]

      source_path = site.source + source
      raise "#{source_[path]} is not readable" unless File.readable?(source_path)

      destination_path = "/cache/resize/"
      destination = site.source + destination_path

      FileUtils.mkdir_p destination

      ext = File.extname(source)
      desc = options.gsub(/[^\da-z]+/i, '')

      sha = Digest::SHA256.file source_path

      destination_file_name = "#{sha}_#{desc}#{ext}"
      destination += destination_file_name

      if !File.exist?(destination) || File.mtime(destination) <= File.mtime(source_path)

        puts "Thumbnailing #{source_path} to #{destination} (#{options})"

        image = MiniMagick::Image.open(source_path)
        image.strip
        image.resize options
        image.write destination
        site.static_files << Jekyll::StaticFile.new(site, site.source, destination_path, destination_file_name)
      end

      destination_path + destination_file_name
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)