class Video < ActiveRecord::Base
  validates :skater_id, presence: true
  validates :spot_id, presence: true
  validates :name, presence: true
  validates :spot_id, presence: true, uniqueness: true
  validates :category, presence: true
end
