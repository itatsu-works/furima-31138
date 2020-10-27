FactoryBot.define do
  factory :item do
    
    price               { Faker::Number.between(from: 300, to: 9999999)}
    days_id             { Faker::Number.between(from: 2, to: 4) }
    area_id             { Faker::Number.between(from: 2, to: 48) }
    cost_burden_id      { Faker::Number.between(from: 2, to: 3) }
    status_id           { Faker::Number.between(from: 2, to: 7) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    description         { Faker::Lorem.characters(number: 300) }
    name                { Faker::Lorem.characters(number: 20) }
    #image               { Faker::Lorem.sentence }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/peach-1.jpg'), filename: 'peach-1.jpg')
    end

    association :user
  end
end
