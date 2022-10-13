require 'faker'

FactoryBot.define do
  factory :turno do
    nombre_completo { Faker::Name.name }
    comuna { Faker::Name.name }
    direccion_salida { Faker::Adress.street_adress }
    dia_semana { 18.years.ago }
    hora_salida { Time.now }
    limite_personas { 5 }
    direccion { Faker::Name.name }
    descripcion { Faker::Lorem.paragraph }
    tipo { Faker::Name.name }
  end
end
