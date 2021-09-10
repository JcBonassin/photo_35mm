class Photo < ApplicationRecord
    extend FriendlyId
    friendly_id :user_id, use: :slugged
    belongs_to :user
    has_many :comments
    has_many :labels
    #has_many :labellings
    #has_many :labels, through: :labellings
    include ImageUploader::Attachment(:image)
    validates :body, :title, :image, presence: true
    acts_as_taggable_on :tags
    acts_as_votable
end
