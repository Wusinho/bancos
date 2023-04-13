# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = '123456'
2.times { |i| User.create(email: "user_#{i}@gmail.com", password: password ) }

def true_false?
  [true,false].sample
end

users = User.all
users.each do |user|
  [15, 25].sample.times {
    provider = Provider.create(
      name: Faker::Company.name,
      nit: Faker::PhoneNumber.subscriber_number(length: 9),
      contact_name: Faker::Name.name,
      phone: true_false? ? Faker::PhoneNumber.subscriber_number(length: 9) : '',
      user_id: user.id
    )
    if [true, false].sample
      [1,2,3].sample.times {
        Bank.create(
          name: Faker::Bank.name,
          account: true_false? ? Faker::Bank.account_number(digits: 15) : '',
          provider_id: provider.id
        )
      }
    end
  }

end
