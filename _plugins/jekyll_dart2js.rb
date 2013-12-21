module Jekyll

  class DartFile < StaticFile
    def write(dest)
      # do nothing
    end
  end

  # Expects a dart2js: key in your _config.yml file with the path to a local dart/dart-sdk/bin/dart2js
  class Dart2JSGenerator < Generator
    safe true
    priority :low

    def generate(site)

      raise "Missing 'dart2js' path in site configuration" if !site.config['dart2js']
      raise "Missing 'dart_src' key in site configuration" if !site.config['dart_src']
      raise "Missing 'dart_main' filename in site configuration" if !site.config['dart_main']

      dart_path = "#{site.config['dart_src']}/#{site.config['dart_main']}"
      js_name = site.config['dart_main'].gsub('.dart', '.js')
      js_path = "_site/js/#{js_name}"

      begin
        command = [site.config['dart2js'],
                   "--out=#{js_path}",
                   dart_path,
                   "--minify"
        ].join(' ')

        puts 'Compiling Dart to JavaScript: ' + command

        `#{command}`

        raise "Dart2JS compilation error" if $?.to_i != 0
      end

      # Add this output file so it won't be cleaned
      site.static_files << DartFile.new(site, site.source, 'js', js_name)
      site.static_files << DartFile.new(site, site.source, 'js', "#{js_name}.map")
    end

  end
end