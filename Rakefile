require 'anemone'
require 'bundler/gem_tasks'
require 'colorize'
require 'diffy'
require 'fileutils'

OUT_DIR = './results'

spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end

def arguments
  ARGV.each { |a| task a.to_sym do ; end }
  ARGV.drop 1
end

def slugify(url)
  url.gsub(/^https?/, '').gsub(/\W/,'_').gsub(/^_+/, '')
end

namespace :link do
  desc 'Crawl one or more sites, create list of links'
  task :crawl do
    arguments.each do |arg|
      url   = arg.chomp('/')
      file  = "#{OUT_DIR}/#{slugify url}_links.txt"
      links = []

      FileUtils.mkdir_p OUT_DIR
      Anemone.crawl(url) do |anemone|
        anemone.on_every_page do |p|
          printf("\rCrawling... %s".colorize(:cyan), spinner.next)
          sleep 0.04
          links << p.url.to_s.chomp('/').sub(url, '')
        end
      end

      links.sort!
      links.uniq!
      links.reject! { |l| l.start_with? 'http' }

      puts "\nWriting to #{file}"
      File.write file, links.join("\n"), mode: 'w'
      puts "Done ✓".colorize :green
    end
  end

  desc 'diff 2 files'
  task :diff do
    files = arguments.take 2
    Diffy::Diff.default_format = :color
    puts Diffy::Diff.new files.first, files.last, source: 'files'
  end
end
