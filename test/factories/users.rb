# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    username 'user'
    name 'Site User'
    password 'secret'
    password_confirmation 'secret'
    admin false
  end

  factory :admin, class: 'User' do
    username 'admin'
    name 'Site Administrator'
    password 'secret'
    password_confirmation 'secret'
    admin true
  end
end
