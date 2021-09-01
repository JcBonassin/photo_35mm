class Photo < ApplicationRecord
    belongs_to :user
    has_many :comments
    include ImageUploader::Attachment(:image)
    validates :body, :title, :image, presence: true
end
