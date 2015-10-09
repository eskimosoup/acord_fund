class ArticleUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [249, 249]
  end

  version :show do
    process resize_to_fill: [362, 362]
  end

end
