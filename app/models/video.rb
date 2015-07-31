class Video < ActiveRecord::Base
  validates :skater_id, presence: true
  validates :spot_id, presence: true
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :spot_id, presence: true
  validates :category, presence: true, inclusion: { in: %w(trick line slam),
    message: "%{category} is not a valid category" }
  belongs_to :spot
  belongs_to :skater
  has_many :votes
end
