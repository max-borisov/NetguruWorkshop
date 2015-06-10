# Categories
apple = Category.where(name: 'Apple').pluck(:id).first
android = Category.where(name: 'Android').pluck(:id).first
windows = Category.where(name: 'Windows').pluck(:id).first

# Users
tom = User.where(email: 'tom@gmail.com').pluck(:id).first
jack = User.where(email: 'jack@gmail.com').pluck(:id).first
matt = User.where(email: 'matt@gmail.com').pluck(:id).first

Product.create!([
    {
        title: 'iPhone 5C',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: apple,
        user_id: tom
    },
    {
        title: 'iPhone 5s',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: apple,
        user_id: tom
    },
    {
        title: 'iPhone 6',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: apple,
        user_id: jack
    },
    {
        title: 'iPhone 6 Plus',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: apple,
        user_id: matt
    },
    {
        title: 'Apple Watch',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: apple,
        user_id: matt
    },
    {
        title: 'HTC One (M8)',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: android,
        user_id: tom
    },
    {
        title: 'HTC One (M9)',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: android,
        user_id: matt
    },
    {
        title: 'Samsung Galaxy S6 Edge',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: android,
        user_id: jack
    },
    {
        title: 'Nokia Lumia 830',
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: windows,
        user_id: tom
    },
    {
        title: "Microsoft's 5.7-inch Lumia 640 XL",
        description: Faker::Lorem.paragraph(rand(2..6)),
        price: 99.99,
        category_id: windows,
        user_id: jack
    }
])

puts("#{Product.count} product(s) have been created")