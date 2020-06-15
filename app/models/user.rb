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

  validates :nickname, presence: true, uniqueness: true
  mount_uploader :icon_image, UserIconUploader
end
