namespace :dev do
  task add_name: :environment do

    User.all.each do |user|
      user.name = user.email.split("@")[0]
      user.save
    end

    puts "add name attribute to user"
  end
end