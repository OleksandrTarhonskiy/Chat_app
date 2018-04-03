source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem "pg", "~> 0.18"
gem 'puma', '~> 3.7'
gem 'bcrypt', '~> 3.1.7'
gem 'decent_exposure'
gem 'rack-cors'
gem 'active_model_serializers'

group :development, :test do
  gem 'byebug', platforms: %I[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %I[mingw mswin x64_mingw jruby]

gem 'rack-cors'
