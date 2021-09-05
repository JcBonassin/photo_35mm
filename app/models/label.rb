class Label < ApplicationRecord
    belongs_to :photo
    validates :tag, :presence => true, length: { maximum: 10}

    def find_by_label
        photos_match = []
        Photo.all.each do |photo|
          photo.labels.each do |label|
            label == Label.find(self.id).tag
            photos_match.push(photo)
          end
        end
        photos_match
      end
end
