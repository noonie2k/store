# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    username 'user'
    password 'secret'
    password_confirmation 'secret'
    admin false
  end

  factory :admin, class: 'User' do
    username 'admin'
    password 'secret'
    password_confirmation 'secret'
    admin true
  end
end
