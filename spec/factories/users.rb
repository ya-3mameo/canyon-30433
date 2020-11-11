FactoryBot.define do
  factory :user do
    nickname              { 'ozawa' }
    email                 { 'sample@sample.com' }
    password              { '123asdf' }
    password_confirmation { password }
    age                   { 45 }
    location              { '北海道' }
    hobby                 { '渓谷巡りです' }
    canyon_number         { 5 }
    birthday              { '2001-01-01' }
  end
end
