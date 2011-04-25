class Payment < ActiveRecord::Base
  belongs_to :vendor
  validate_presence_of :amount
end
