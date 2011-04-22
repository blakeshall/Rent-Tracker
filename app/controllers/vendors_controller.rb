class VendorsController < ApplicationController
  respond_to :html, :json

  def show
    @vendor = Vendor.find(params[:id])
    @recent_payments = Payment.where("vendor_id = ?", @vendor.id).order('created_at DESC').take(5)
    
  end

  def index
    @vendors = Vendor.all
    respond_with @vendors
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create(params[:vendor])

    if @vendor.save
      #respond_with @vendor, notice: "Added Vendor"
    else
      #render :new, alert: "Something went wrong"
    end
  end
  
  def edit
    @vendor = Vendor.find(params[:id])
  end
  
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to(@vendor,
                      :notice => 'Vendor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vendor.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def reset_week
    @vendors = Vendor.week
  end
  
  def reset_month
    @vendors = Vendor.month
  end
  

    
  
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to(vendors_url)
  end
end


