source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "ahoy_matey", "3.0.4"
gem "bootsnap", "1.4.7", require: false
gem "groupdate", "5.0.0"
gem "jbuilder", "~> 2.7"
gem "light-service", "0.14.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "redis", "~> 4.0"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "webpacker", "~> 4.0"
gem "chartkick", "3.3.2"
gem "devise", "4.7.2"
gem "faker", "2.13.0"
gem "sidekiq", "6.1.1"
gem "timecop", "0.9.1"
gem "view_component", "2.18.0"
gem "stamp", "0.6.0"
gem "pay", git: "https://github.com/nm/pay", branch: "paddle"
gem 'paddle_pay', '~> 0.0.1'
gem "cancancan", "~> 3.1"

group :development, :test do
  gem "dotenv-rails", "2.7.6"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry", "0.13.1"
  gem "standard", "0.4.7"
end

group :development do
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver", "3.142.7"
  gem "webdrivers", "4.4.1"
end

