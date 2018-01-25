Gem::Specification.new do |s|
  s.name        = 'jekyll-resize'
  s.version     = '0.0.1'
  s.date        = '2018-1-24'
  s.summary     = 'Liquid filter to resize images'
  s.description = ''
  s.authors     = ['Mike Neumegen']
  s.email       = 'mike@cloudcannon.com'
  s.files       = ['lib/jekyll-resize.rb']
  s.homepage    = 'http://rubygems.org/gems/jekyll-resize'
  s.license       = 'MIT'

  s.add_dependency 'jekyll', '~> 3.3'
  s.add_dependency 'mini_magick', "4.8.0"
end