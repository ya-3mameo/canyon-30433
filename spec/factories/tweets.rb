FactoryBot.define do
  factory :tweet do
    title         { '渓谷名です' }
    concept       { '渓谷についてです' }
    price         { 1000 }
    prefecture_id { 3 }
    visit_day     { '2001-01-01' }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
