class PartnerUploader < Optimadmin::ImageUploader

  version :small do
    process resize_to_fill: [210, 80]
  end

  version :show do
    process resize_to_fill: [200, 200]
  end

end
