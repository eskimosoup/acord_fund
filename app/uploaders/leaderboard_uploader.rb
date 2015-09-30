class LeaderboardUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_limit: [728, 90]
  end

end
