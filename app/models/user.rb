class User < ApplicationRecord
  extend FriendlyId
  friendly_id :first_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, :omniauth_providers  => [:facebook]
  has_one_attached :avatar 
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :labels, through: :photos

    validates_presence_of :first_name, uniqueness: true
    #validates :first_name, presence: :true, uniqueness: { case_sensitive: false }
    #validates :last_name, presence: :true, uniqueness: { case_sensitive: false }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, uniqueness: true
    acts_as_taggable_on :tags
    acts_as_voter

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end


  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, first_name: name_split[0], last_name: name_split[1], email: auth.info.email, name: name_split[0], slug: name_split[0], image: auth.info.image, password: Devise.friendly_token[0, 20])
      user
  end
end
