class Unlock < ActiveRecord::Base
  belongs_to :user
  belongs_to :aspect
end
