class VendorsController < ApplicationController
  before_action :find_vendor, except: %i[create index]

  def index
    @vendors = Vendor.all
    render json: @vendors, status: :ok
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      render json: @vendor, status: :created
    else
      render json: { errors: @vendor.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    if @vendor.update(vendor_params)
      render json: @vendor, status: :ok
    else  
      render json: { errors: @vendor.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def destroy
    if @vendor.destroy
      render json: { message: "Record has been deleted" }, status: :ok
    else  
      render json: { errors: @vendor.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def show
    render json: @vendor, status: :ok
  end

  private

  def find_vendor
    @vendor = Vendor.find_by(id: params[:id])
    render json: { errors: 'Vendor not found' } if @vendor.nil?
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Vendor not found' }, status: :not_found
  end

  def vendor_params
    params.permit(
       :name, :email, :mobile_number, :address
    )
  end
end
