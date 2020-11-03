FactoryBot.define do
  factory :sold_item do

    item_id           { 1 }
    user_id           { 1 }
    post_number       { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 2,to: 4) }
    city              { '有楽町'  }
    address           { '1丁目' }
    phone_number      { '09812345678' }
  end
end
