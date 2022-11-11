# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'grupo76@uc.cl', password: 'admin76', password_confirmation: 'admin76')
Usuario.create!(email: 'diegom@uc.cl', encrypted_password:'123123', nombre: 'Diego', telefono: '123123123')
Usuario.create!(email: 'clementet@uc.cl', encrypted_password:'123123', nombre: 'Clemente', telefono: '123123123')