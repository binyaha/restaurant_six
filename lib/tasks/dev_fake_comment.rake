namespace :dev do
  task fake_comment: :environment do
    Comment.destroy_all

    
        Restaurant.all.each do |restaurant|
            3.times do |j|
            Comment.create!(
            content: FFaker::Lorem.paragraph,
            restaurant_id: restaurant.id,
            user_id: User.all.sample.id
            )
            end
        end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments data each restaurant 3 comments"
  end

end