class Track < ActiveRecord::Base
  validates :name, presence: true

  belongs_to(
    :album,
    inverse_of: :tracks
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )

  has_many(
    :notes
  )
end