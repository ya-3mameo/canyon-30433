FactoryBot.define do
  factory :user do
    nickname              { 'ozawa' }
    email                 { 'sample@sample.com' }
    password              { '123asdf' }
    password_confirmation { password }
  end
end
