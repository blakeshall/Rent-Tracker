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
    if recent_payments.map(&:amount).reduce(&:+) == nil
      0
    else
      recent_payments.map(&:amount).reduce(&:+)
    end
  end

  def paid_up?
   debt <= 0
  end

  def debt
   amount - total_paid
  end
end
