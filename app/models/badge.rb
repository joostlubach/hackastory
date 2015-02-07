class Badge < ActiveRecord::Base
  belongs_to :aspect
  belongs_to :user

  validates_presence_of :badge
end
