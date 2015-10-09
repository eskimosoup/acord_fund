class PageUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [362, 362]
  end

end
