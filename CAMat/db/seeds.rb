# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Locker.create(owner: 'usuario1', code: 'A1')
    Locker.create(owner: '', code: 'B7')
    User.create(email: 'admin@camat.com', nome: 'administradorraiz', documento: '1', telefone:'11111', password: '123456', password_confirmation: '123456', admin: true)