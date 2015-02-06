class Story < ActiveRecord::Base

  has_many :aspects, dependent: :destroy, autosave: true
  has_many :unlocks, through: :aspects
  has_many :unlockers, through: :unlocks, source: :user

  def unlock(aspect, unlocker)
    aspect = aspects.find_by_aspect!(aspect)
    Unlock.create! aspect: aspect, user: unlocker

    aspect.order = self.aspects.unlocked.maximum(:order) + 1
    aspect.save!

    aspect
  end

end