FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 5) }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    last_name               { '阿部' }
    first_name              { '慎之助' }
    last_kana               { 'アベ' }
    first_kana              { 'シンノスケ' }
    birthday                { Faker::Date.birthday(min_age: 17, max_age: 70) }
  end
end
