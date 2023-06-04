# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create(email: 'patient1@example.com', phone: '11234567890', role: 'patient', password: '123456',  password_confirmation: '123456')
User.create(email: 'patient2@example.com', phone: '21234567890', role: 'patient', password: '123456',  password_confirmation: '123456')

DoctorsCategory.create(name: 'therapist')
DoctorsCategory.create(name: 'dentist')
DoctorsCategory.create(name: 'surgeon')
User.create(email: 'doctor1@example.com', phone: '23456789011', first_name: 'FN_D1', last_name: 'LN_D1', role: 'doctor', doctors_category_id: 1, password: '123456',  password_confirmation: '123456')
User.create(email: 'doctor2@example.com', phone: '23456789012', first_name: 'FN_D2', last_name: 'LN_D2', role: 'doctor', doctors_category_id: 2, password: '123456',  password_confirmation: '123456')
User.create(email: 'doctor3@example.com', phone: '23456789013', first_name: 'FN_D3', last_name: 'LN_D3', role: 'doctor', doctors_category_id: 3, password: '123456',  password_confirmation: '123456')