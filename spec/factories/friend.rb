FactoryBot.define do
  factory :friend do
    name { Faker::Lorem.characters(number: 4) }
    surname { Faker::Lorem.characters(number: 4)}
    email { 'kasiakowalska@gmail.com' }
    phone_number { '123456789' }
    place_of_knowing { :other }
  end
end
