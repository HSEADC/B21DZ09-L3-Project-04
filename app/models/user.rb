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

  has_many :likes
  has_many :answers_i_liked, through: :likes, source: 'answer'

  has_one :profile
  has_one :onboarding
  has_one :alert

  after_create :create_user_profile
  after_create :create_user_onboarding
  after_create :create_user_alert

  def create_user_profile
    self.create_profile
  end

  def create_user_onboarding
    self.create_onboarding
  end

  def create_user_alert
    self.create_alert
  end

  mount_uploader :avatar_image, AvatarImageUploader
end
