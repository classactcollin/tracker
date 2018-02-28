class InvisalignTracker < ActiveRecord::Base
  belongs_to :tracker
  def self.getSum(dayNumber)
    InvisalignTracker.where(daynumber: dayNumber).map { |n| n.duration }.sum
  end
end
