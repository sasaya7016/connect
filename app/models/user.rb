class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  has_many :likes, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :nickname, presence: true, uniqueness: true
  mount_uploader :icon_image, UserIconUploader

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
