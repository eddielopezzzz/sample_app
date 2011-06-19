

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "lalo",
                 :email => "eddielopezzzz@hotmail.com",
                 :password => "Kristian1",
                 :password_confirmation => "Kristian1")
    admin.toggle!(:admin)
    
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
    end
  end
end
