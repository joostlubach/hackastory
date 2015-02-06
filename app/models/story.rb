class Story < ActiveRecord::Base

  has_many :aspects, dependent: :destroy, autosave: true
  has_many :unlocks, through: :aspects
  has_many :unlockers, through: :unlocks, source: :user

end