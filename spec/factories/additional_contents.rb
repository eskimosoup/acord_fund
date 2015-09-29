FactoryGirl.define do
  factory :additional_content do
    area "MyString"
    title "MyString"
    content "<p>MyText</p>"
    video_url "MyString"
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :additional_content_with_image, traits: [:with_image]
    trait :with_button do
      button_text "test"
      button_link "http://www.google.com"
    end
    factory :additional_content_with_button, traits: [:with_button]
  end

end
