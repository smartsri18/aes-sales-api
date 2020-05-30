class CustomersController < ApplicationController
  before_action :find_customer, except: %i[create index]

  def index
    @customers = Customer.all
    render json: @customers, status: :ok
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: { errors: @customer.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer, status: :ok
    else  
      render json: { errors: @customer.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      render json: { message: "Record has been deleted" }, status: :ok
    else  
      render json: { errors: @customer.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def show
    render json: @customer, status: :ok
  end

  private

  def find_customer
    @customer = Customer.find_by(id: params[:id])
    render json: { errors: 'Customer not found' } if @customer.nil?
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Customer not found' }, status: :not_found
  end

  def customer_params
    params.permit(
       :name, :email, :mobile_number, :address
    )
  end
end
