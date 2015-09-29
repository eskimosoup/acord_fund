FactoryGirl.define do
  factory :leaderboard do
    title "MyString"
    area "MyString"
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true
    trait :with_link do
      link "http://www.google.com"
    end
    factory :leaderboard_with_link, traits: [:with_link]
  end
end
