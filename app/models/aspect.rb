class Aspect < ActiveRecord::Base

  belongs_to :story
  has_one :unlock
  has_one :unlocked_by, through: :unlock, source: :user

  validates_presence_of :story
  validates_presence_of :order
  validates_uniqueness_of :aspect, scope: [:story_id]

  scope :ordered, ->{ order(:order) }

end
