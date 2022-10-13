require 'faker'

FactoryBot.define do
  factory :request do
    contenido { Faker::Lorem.paragraph }
    hora { DateTime.now }
  end
end
