require 'faker'

FactoryBot.define do
  factory :request do
    username { Faker::Name.name }
    turno_id { 5 }
  end
end
