class Photo < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :labels
    include ImageUploader::Attachment(:image)
    validates :body, :title, :image, presence: true
end
