class AdditionalContentUploader < Optimadmin::ImageUploader

  version :home_page_section_2 do
    process resize_to_limit: [491, 551]
  end

  version :home_page_section_3 do
    process resize_to_limit: [388, 345]
  end

end
