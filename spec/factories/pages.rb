FactoryGirl.define do
  factory :page do
    title "Page title"
    style "basic"
    layout "application"
    content "<p>test</p>"
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    trait :with_file do
      file { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
      file_download_text "Apply now"
    end
    factory :page_with_image, traits: [:with_image]
    factory :page_with_file, traits: [:with_file]
  end

end
