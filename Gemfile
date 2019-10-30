source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.6.3'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'simple_form'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'mocha', '~> 1.4.0'
  gem 'minitest'
  gem 'simplecov'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.3.1'
gem 'devise', '~> 4.7.1'
gem 'jquery-rails'
gem 'pg'
gem 'slim-rails'
gem 'mini_racer'
gem 'kaminari'
# gem 'therubyracer', :platform=>:ruby
group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'capistrano3-puma'
  gem 'rails_layout'
end
group :development, :test do
  gem 'rubocop'
end
