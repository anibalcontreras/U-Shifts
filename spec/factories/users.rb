require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Name.name }
    email { Faker::Internet.email }
    age { 21 }
    direccion { Faker::Adress.street_adress }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    password { Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 4, min_numeric: 3) }
    image { Faker::File.file_name(dir: 'path/to') }
  end
end
