Category.create!([
    {
        name: 'Apple'
    },
    {
        name: 'Android'
    },
    {
        name: 'Windows'
    }
])

puts("#{Category.count} categories have been created")