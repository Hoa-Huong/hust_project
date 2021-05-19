source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.3"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "rubocop", ">= 0.49.0"
gem "bootstrap-sass", "3.4.1"
gem "rails-i18n"
gem "config"
gem "figaro"
gem "font-awesome-rails"
gem "faker", :git => "https://github.com/faker-ruby/faker.git", :branch => "master"
gem "devise"
gem "jquery-rails"
gem "kaminari"
gem "ratyrate", :github => "wazery/ratyrate"
gem "sprockets-rails", "2.3.3"
gem "cancancan"
gem "groupdate"
gem "chartkick"
gem "ransack", github: "activerecord-hackery/ransack"
gem "select2-rails"
gem "omniauth"
gem "omniauth-facebook"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
