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

  def self.create_from_aspects!(aspects)
    story = Story.create
    %i(what when where who why).each do |aspect|
      if content = aspects[aspect]
        TextAspect.create!(:story => story, :aspect => aspect.to_s, :text_content => content)
      end
    end

    unlocked_aspect = story.aspects[rand(story.aspects.length)]
    unlocked_aspect.update_attributes! :order => 1

    story
  end

  def unlocked_by(user)
    unlockers.include?(user)
  end

end