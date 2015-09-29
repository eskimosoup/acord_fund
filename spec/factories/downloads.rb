FactoryGirl.define do
  factory :download do
    title "MyString"
    display true
    file { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }    
  end

end
