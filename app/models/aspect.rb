class Aspect < ActiveRecord::Base

  belongs_to :story
  has_one :unlock
  has_one :unlocker, through: :unlock, source: :user
  has_many :badges

  validates_presence_of :story
  validates_uniqueness_of :aspect, scope: [:story_id]

  scope :ordered,  ->{ order(:order) }
  scope :unlocked, -> { ordered.joins{unlock.outer}.where{ (order == 1) | (unlock.id != nil) } }
  scope :locked,   -> { ordered.joins{unlock.outer}.where{ (order != 1) | (order == nil) }.where{unlock.id == nil} }
  scope :unlocked_by, ->(user) { joins{unlock.outer}.where{unlock.user == user} }

  def primary
    order == 1
  end

  def unlocked
    primary || unlocker != nil
  end

  def locked
    !unlocked
  end

end
