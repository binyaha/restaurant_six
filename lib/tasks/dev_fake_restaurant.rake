#function3-step5 寫製造假資料程式 要點1.開頭寫法 2.摧毀所有資料再製造 3.上網找ffaker格式 4.寫一段puts 知道建立成功
namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category_id: Category.all.sample.id,
     
        )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

end
#------------ffaker建立成功 可進console測試 接著做kaminari 到controller admin::restaurant