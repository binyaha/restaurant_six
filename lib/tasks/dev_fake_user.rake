namespace :dev do
  task fake_user: :environment do
    User.destroy_all
    User.create(email: "admin@admin.com", password: "111111", role: "admin")

    20.times do |i|
      User.create!(
        email: FFaker::Internet.free_email,
        password:111111
        )
    end
    puts "have created fake user"
    puts "now you have #{User.count} user data"
  end

end