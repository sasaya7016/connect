class Tweet < ApplicationRecord
  validates :text, presence: true, unless: :image?
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  # 既にlike実行しているかのメソッド
  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end
end
