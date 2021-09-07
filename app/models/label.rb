class Label < ApplicationRecord
    extend FriendlyId
    friendly_id :tag, use: :slugged
    belongs_to :photo
    #has_many :labellings
    #has_many :photos, through: :labellings
    validates :tag, :presence => true, length: { maximum: 10}
    acts_as_taggable_on :tags

end
