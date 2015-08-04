class Vote < ActiveRecord::Base
  validates :voter_id, presence: true
  validates :video_id, presence: true
  validates :result, presence: true, inclusion: { in: -1..1 }
  validates_uniqueness_of :voter_id, :scope => :video_id
  belongs_to :video
end
