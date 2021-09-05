class Photo < ApplicationRecord
    extend FriendlyId
    friendly_id :user_id, use: :slugged
    belongs_to :user
    has_many :comments
    has_many :labels
    include ImageUploader::Attachment(:image)
    validates :body, :title, :image, presence: true
end
