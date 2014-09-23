DB = Sequel.connect("postgres://localhost:5432/dvr_app2_development")

Dir['./helpers/*.rb'].each { |helper| require helper }
Dir['./models/*.rb'].each { |model| require model }
require 'zip'
require 'sequel'
require 'yaml'
require 'rack-flash'
require 'bcrypt'
require './controllers/application_controller'
Dir['./controllers/*.rb'].each { |controller| require controller }


