class PaymentsController < ApplicationController

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @payment = @vendor.payments.create(params[:payment])
    redirect_to vendor_path(@vendor)
  end




end