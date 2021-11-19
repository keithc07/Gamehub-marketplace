# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


State.create( id: 1, state_name: 'NSW')
State.create( id: 2, state_name: 'QLD')
State.create( id: 3, state_name: 'SA')
State.create( id: 4, state_name: 'TAS')
State.create( id: 5, state_name: 'VIC')
State.create( id: 6, state_name: 'WA')

Console.create( id: 1, console_type: 'PS4/PS5')
Console.create( id: 2, console_type: 'XboxOne')
Console.create( id: 3, console_type: 'Nintendo Switch')
Console.create( id: 4, console_type: 'PC')
Console.create( id: 5, console_type: 'Others')
