class Vendor < ActiveRecord::Base
  has_many :payments , :dependent => :destroy
  
  def payments_between(start_date, end_date)
   Payment.where("vendor_id = ? AND created_at BETWEEN ? AND ?", id, start_date, end_date)
  end

  def recent_payments
   start_date = weekly? ? Date.today.ago(1.week) : Date.today.ago(1.month)

   payments_between(start_date, Time.now)
  end

  def total_paid

    total = 0
    if recent_payments != nil 
      recent_payments.each do |payment|
        if payment.amount != nil
          total += payment.amount
        end
      end
    end

    return total
    
    
  end

  def paid_up?
    if debt <= 0.0
      true
    else
      false
    end
  end

  def debt
   amount - total_paid
  end
end
