class Photo < ApplicationRecord
    belongs_to :user
    include ImageUploader::Attachment(:image)
    validates :body, :title, :image, presence: true
end
