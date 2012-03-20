# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    synopsis "MyText"
    isbn "ISBN 123-456-789-0"
    author nil
  end
end
