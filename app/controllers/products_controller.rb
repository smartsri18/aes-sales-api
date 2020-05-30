class ProductsController < ApplicationController
  before_action :find_product, except: %i[create index]

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def create
    @product = Product.new(product_params)
    @product.total_price = product_params[:quantity] * product_params[:rate]
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else  
      render json: { errors: @product.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: { message: "Record has been deleted" }, status: :ok
    else  
      render json: { errors: @product.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def show
    render json: @product, status: :ok
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
    render json: { errors: 'Product not found' } if @product.nil?
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Product not found' }, status: :not_found
  end

  def product_params
    params.permit(
      :invoice_id, :name, :code, :stock, :rate, :quantity, :total_price
    )
  end
end
