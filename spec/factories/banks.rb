FactoryBot.define do
  factory :bank do
    name { Faker::Name.name }
    user
  end
end
