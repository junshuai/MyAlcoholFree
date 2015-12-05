require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.username 'testuser'
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :product do |f|
    f.title         'title'
    f.description   'desc'
    f.thumbnail_url 'img.jpg'
    f.price         '0.1'
    f.supplier      'apple'
  end
end
