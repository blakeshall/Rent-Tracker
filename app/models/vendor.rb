class Vendor < ActiveRecord::Base
  has_many :payments , :dependent => :destroy
  
  def current
    v = Vendor.find(params[:id])
    if v.weekly == true
      "TRUE" 
    else
      "FALSE"
    end
    
  end
end
