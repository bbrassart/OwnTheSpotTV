class Vote < ActiveRecord::Base
  validates :voter_id, presence: true
  validates :video_id, presence: true
  validates :result, presence: true, inclusion: { in: -1..1 }
  belongs_to :video
end
