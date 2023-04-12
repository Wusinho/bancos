FactoryBot.define do
  factory :provider do
    name { Faker::Company.name }
    nit { "901362343-4" }
    contact_name { Faker::Name.name  }
    phone { Faker::PhoneNumber.subscriber_number(length: 9) }
    user
  end
end
