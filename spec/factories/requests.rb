require 'faker'

FactoryBot.define do
  factory :request do
    descripcion { Faker::Lorem.paragraph }
  end
end
