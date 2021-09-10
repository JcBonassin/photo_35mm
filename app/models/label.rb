class Label < ApplicationRecord
    extend FriendlyId
    friendly_id :tag, use: :slugged
    belongs_to :photo
    #has_many :labellings
    #has_many :photos, through: :labellings
    #validates :tag, :presence => true, length: { maximum: 10}
    acts_as_taggable_on :tags

    def find_by_label
      photos_match = []
      Photo.all.map do |photo|
        photo.labels.each do |label|
          label == Label.find(label.id).tag
          photos_match.push(photo)
        end
      end
      photos_match.uniq
    end

end
