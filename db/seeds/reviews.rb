# Users
tom = User.where(email: 'tom@gmail.com').pluck(:id).first
jack = User.where(email: 'jack@gmail.com').pluck(:id).first
matt = User.where(email: 'matt@gmail.com').pluck(:id).first

i_phone_5s = Product.where(title: 'iPhone 5s').pluck(:id).first
i_phone_6 = Product.where(title: 'iPhone 6').pluck(:id).first
apple_watch = Product.where(title: 'Apple Watch').pluck(:id).first
htc_one_m9 = Product.where(title: 'HTC One (M9)').pluck(:id).first
nokia_lumia_830 = Product.where(title: 'Nokia Lumia 830').pluck(:id).first

Review.create!([
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 5,
        product_id: i_phone_5s,
        user_id: matt
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 4,
        product_id: i_phone_5s,
        user_id: jack
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 4,
        product_id: i_phone_5s,
        user_id: tom
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 3,
        product_id: i_phone_6,
        user_id: matt
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 4,
        product_id: apple_watch,
        user_id: jack
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 5,
        product_id: apple_watch,
        user_id: tom
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 5,
        product_id: htc_one_m9,
        user_id: tom
    },
    {
        content: FFaker::Lorem.paragraph(rand(1..5)),
        rating: 3,
        product_id: htc_one_m9,
        user_id: jack
    }
])

puts("#{Review.count} reviews have been created")