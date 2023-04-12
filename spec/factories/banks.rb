FactoryBot.define do
  factory :bank do
    name { Faker::Name.name }
    account { rand.to_s[2..16] }
    user
  end
end
