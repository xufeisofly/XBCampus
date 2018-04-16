source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'dotenv-rails' # 从.env中读取环境变量

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'select2-rails' # select控件
gem 'kaminari' # 瀑布式滚动插件，放在elasticsearch之前
gem 'will_paginate' # 分页空间
gem 'bootstrap-will_paginate' # bootstrap
gem 'bootstrap-sass'
gem 'bcrypt' #password
gem 'elasticsearch-model' # es搜索
gem 'elasticsearch-rails'
gem 'active_model_serializers', '~> 0.10.0'

gem 'mysql2'
gem 'version_diff', path: '../version_diff'

# Uploader
gem 'carrierwave' # 图片上传
gem 'carrierwave-aliyun' # 图片上传阿里云oss

# Authentication and Authorization
gem 'pundit'
gem 'omniauth-oauth2', '~> 1.3.1' # 第三方登录认证
gem 'omniauth-qq'
gem 'omniauth-wechat-oauth2'
gem 'omniauth-weibo-oauth2'

# forms
gem 'simple_form'
gem 'cocoon'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'serviceworker-rails'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'binding_of_caller'
  gem 'rubocop', '~> 0.38.0', require: false
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-brakeman', require: false

  # Tests
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'email_spec'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :productiton do
  gem 'pg', '0.18.4'
end
