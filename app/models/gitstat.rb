class Gitstat < ActiveRecord::Base
  validates_uniqueness_of :nickname
end
