class Payment < ActiveRecord::Base
  belongs_to :vendor
  validates :amount, :presence => true
end
