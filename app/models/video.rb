class Video < ActiveRecord::Base
  validates :skater_id, presence: true
  validates :spot_id, presence: true
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :spot_id, presence: true
  validates :category, presence: true
  belongs_to :spot
  belongs_to :skater
end
