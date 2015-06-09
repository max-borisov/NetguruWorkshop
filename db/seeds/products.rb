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
        description: 'Available in green, blue, yellow, pink, and white, iPhone 5c features an A6 chip, LTE wireless, an 8MP iSight camera, and iOS 8.',
        price: 99.99,
        category_id: apple,
        user_id: tom
    },
    {
        title: 'iPhone 5s',
        description: 'Available in silver, gold, and space gray, iPhone 5s features an A7 chip, Touch ID, LTE wireless, an 8MP iSight camera, and iOS 8.',
        price: 99.99,
        category_id: apple,
        user_id: tom
    },
    {
        title: 'iPhone 6',
        description: 'Available in silver, gold, and space gray, iPhone 6 features an A8 chip, Touch ID, faster LTE wireless, a new 8MP iSight camera with Focus Pixels, and iOS 8.',
        price: 99.99,
        category_id: apple,
        user_id: jack
    },
    {
        title: 'iPhone 6 Plus',
        description: 'Available in silver, gold, and space gray, iPhone 6 Plus features an A8 chip, Touch ID, faster LTE wireless, a new 8MP iSight camera with Focus Pixels, and iOS 8.',
        price: 99.99,
        category_id: apple,
        user_id: matt
    },
    {
        title: 'Apple Watch',
        description: 'To make the best use of its size and location on your wrist, Apple Watch has all-new interactions and technologies. They let you do familiar things more quickly and conveniently. As well as some things that simply weren’t possible before. So using it is a whole new experience. One that’s more personal than ever.',
        price: 99.99,
        category_id: apple,
        user_id: matt
    },
    {
        title: 'HTC One (M8)',
        description: "So it's all the more impressive that HTC, after making the best-looking phone of 2013 (the HTC One), managed to make the HTC One M8, a phone crammed full of power and great features while improving the design that won it so many accolades.",
        price: 99.99,
        category_id: android,
        user_id: tom
    },
    {
        title: 'HTC One (M9)',
        description: "HTC's 2015 top-of-the-line phone recycles the same sleek design as last year's M8, sticking to the luxurious all-metal case and 1080p HD screen while incorporating key spec improvements -- most notably a speedy, state-of-the-art Qualcomm Snapdragon 810 processor and upgraded front and rear cameras, the latter an attempt to address the M8's biggest shortfall: that its primary camera just wasn't as good as the competition.",
        price: 99.99,
        category_id: android,
        user_id: matt
    },
    {
        title: 'Samsung Galaxy S6 Edge',
        description: "The Samsung Galaxy S6 Edge is the Ferrari to the Samsung Galaxy S6's BMW, the Chanel handbag to the S6's Coach. OK, so maybe the differences aren't that extreme, but you get the point. The S6 Edge earns its right to be called the designer version of the S6, and you'll pay a premium for it.",
        price: 99.99,
        category_id: android,
        user_id: jack
    },
    {
        title: 'Nokia Lumia 830',
        description: "The Nokia Lumia 830 is an affordable flagship smartphone, but it's also a swansong for the venerable Finnish company. Nokia's name is on the way out, and Microsoft will be the brand of choice for the next generation of Lumia phones, with the Microsoft Lumia 535 to be the first successor to the Nokia line.",
        price: 99.99,
        category_id: windows,
        user_id: tom
    },
    {
        title: "Microsoft's 5.7-inch Lumia 640 XL",
        description: "BARCELONA -- The Microsoft Lumia 640 XL that launched here at Mobile World Congress 2015 isn't only bigger than the 5-inch Microsoft Lumia 640. It also has a more upmarket camera and a slightly larger battery.",
        price: 99.99,
        category_id: windows,
        user_id: jack
    }
])

puts("#{Product.count} product(s) have been created")