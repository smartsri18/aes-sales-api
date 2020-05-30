class InvoicesController < ApplicationController
  before_action :find_invoice, except: %i[create index show_based_on_entity]

  def index
    @invoices = Invoice.all
    render json: @invoices, status: :ok
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @gst_amount = (invoice_params[:taxable_amount] * invoice_params[:gst_amount])/100
    @invoice.invoice_amount = invoice_params[:taxable_amount] + @gst_amount
    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: { errors: @invoice.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      render json: @invoice, status: :ok
    else  
      render json: { errors: @invoice.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def destroy
    if @invoice.destroy
      render json: { message: "Record has been deleted" }, status: :ok
    else  
      render json: { errors: @invoice.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def show
    render json: @invoice, status: :ok
  end

  def show_based_on_entity
    @invoices_based_on_entity = Invoice.where(entity_type: params[:entity_type])
    render json: @invoices_based_on_entity, status: :ok
  end

  private

  def find_invoice
    @invoice = Invoice.find_by(id: params[:id])
    render json: { errors: 'Invoice not found' } if @invoice.nil?
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Invoice not found' }, status: :not_found
  end

  def invoice_params
    params.permit(
      :entity_name, :entity_type, :purchased_date, :taxable_amount, :gst_amount, :paid_status, products_attributes: [:name, :code, :rate, :quantity, :total_price]
    )
  end
end
