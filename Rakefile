namespace :greetings do
  desc "Prints thank you"
  task :thank_you do
    puts "thank you"

  task :default => [:thank_you]
  end

  task :greet, [:name] do |cdm, args|
    puts "hello, #{args[:name]}!"
  end
end

desc "Introduces the default task"
task :default do
  puts "Hello I'm the default task!"
end

namespace :cake do

  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flour, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flour => :get_flour do
    puts "Adding flour"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flour => :go_to_store do
    puts "Get Flour"
  end

  task :go_to_store do
    puts "Go to Store"
  end

  desc "things I can't spell"
  task :learn_how_to_spell, [:word] do |cmd, args|
    puts "Learn how to spell, #{args[:word]}"
  end

end

namespace :dozer do

  desc "print ENV"
  task :env do
    sh("ENV")
  end

  desc "shows current folder"
  task :pwd do
    sh("pwd")
  end

  desc "adds views for a resource"
  task :make_views, [:resource_name] do |cmd, args|
    resource = args[:resource_name]
    sh("mkdir views/#{resource}")
    sh("touch views/#{resource}/index.erb")
    FileUtils.touch("views/#{resource}/new.erb")
    # we can call touch directly because we included fileutils
    touch("views/#{resource}/edit.erb")
    touch("views/#{resource}/show.erb")
  end
end


namespace :db do

  desc "creates a database"
  task :create do
    sh("createdb dvr_app_test")
  end

  desc "delete a database"
  task :drop do
    sh("dropdb dvr_app_test")
  end

  desc "seed my db"
  task :seed, [:env] do |cmd, args|
    env = args[:env] || "development"
    # load up sinatra env
    # then populate my database
    # calls rake environment[env]
    Rake::Task['environment'].invoke(env)
    require './db/seeds.rb'
  end
end

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  Bundler.require(:default, ENV["RACK_ENV"])
  require "./config/boot"
end
