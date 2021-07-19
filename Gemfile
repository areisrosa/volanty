# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7'

gem 'pg'
gem 'dry-struct'
gem 'httparty'
gem 'logger'
gem 'rails'
gem 'rake'
gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'pry-byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rswag-specs'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem "webmock"
end

group :test do
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'listen', '3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
