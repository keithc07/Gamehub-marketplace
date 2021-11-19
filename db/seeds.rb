# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

states = ["NSW", "QLD", "SA", "TAS", "VIC", "WA"]

if State.count == 0
    states.each do |state|
        State.create(state_name: state)
    end
end

consoles = ["PS4/PS5", "XboxOne", "Nintendo Switch", "PC", "Others"]

if Console.count == 0
    consoles.each do |console|
        Console.create(console_type: console)
    end
end

