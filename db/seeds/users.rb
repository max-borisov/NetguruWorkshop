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
    },
    {
        email: 'bono@gmail.com',
        firstname: 'Bono',
        lastname: 'Kiddo',
        password: '11111111',
    },
    {
        email: 'amy@gmail.com',
        firstname: 'Amy',
        lastname: 'Spring',
        password: '11111111',
    },
    {
        email: 'admin@gmail.com',
        firstname: 'Super',
        lastname: 'Admin',
        password: '11111111',
        admin: true
    }
])

puts("#{User.count} user(s) have been created")