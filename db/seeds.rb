# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CartItem.destroy_all
# Review.destroy_all
# Book.destroy_all
# Order.destroy_all

puts '*** Cleanup reviews table'
Review.destroy_all

puts '*** Cleanup products table'
Product.destroy_all

puts '*** Cleanup categories table'
Category.destroy_all

puts '*** Cleanup users table'
User.destroy_all

puts ""
require_relative('../db/seeds/users')
require_relative('../db/seeds/categories')
require_relative('../db/seeds/products')
require_relative('../db/seeds/reviews')