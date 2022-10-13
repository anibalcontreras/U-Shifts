require 'faker'

FactoryBot.define do
  factory :turno do
    resenador { Faker::Name.name }
    resenado { Faker::Name.name }
    valoracion { Faker::Number.between(from: 1, to: 10) }
    descripcion { Faker::Lorem.parahgraph }
  end
end
