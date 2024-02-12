class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :answers
  has_many :comments
  has_many :poly_comments, as: :commentable, dependent: :destroy
  has_one :profile
  has_one :onboarding

  after_create :create_profile

  def create_profile
    Profile.create(user_id: id)
  end

  mount_uploader :avatar_image, AvatarImageUploader
end
