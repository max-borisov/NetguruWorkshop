User.create!([
    {
        email: 'tom@gmail.com',
        firstname: 'Tom',
        lastname: 'Jones',
        password: '11111111'
    },
    {
        email: 'jack@gmail.com',
        firstname: 'Jack',
        lastname: 'Bones',
        password: '11111111'
    },
    {
        email: 'matt@gmail.com',
        firstname: 'Matt',
        lastname: 'Kudo',
        password: '11111111',
        admin: true
    }
])

puts("#{User.count} user(s) have been created")