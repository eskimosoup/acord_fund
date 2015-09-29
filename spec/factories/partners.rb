FactoryGirl.define do
  factory :partner do
    name "MyString"
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    content "<p>test</p>"
    display true
    trait :with_website do
      website "http://www.google.com"
    end
    factory :partner_with_website, traits: [:with_website]
  end

end
