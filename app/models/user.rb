class User < ActiveRecord::Base
  has_many :unlocks

  has_many :unlocked_aspects, through: :unlocks, source: :aspect
  has_many :unlocked_stories, through: :unlocked_aspects, source: :story

  scope :ordered, -> { order{name} }
end
