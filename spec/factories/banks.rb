FactoryBot.define do
  factory :bank do
    name { Faker::Name.name }
    account { Faker::Number.number(digits: 15)  }
    provider
  end
end
