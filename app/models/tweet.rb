class Tweet < ApplicationRecord
  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
