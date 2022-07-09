class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    if params[:order] and params[:order][:mechanic_id]
      @orders = Order.search_by_mechanic(params[:order][:mechanic_id])
    elsif params[:order] and params[:order][:category_id]
      @orders = Order.search_by_category(params[:order][:category_id])
    else
      @orders = Order.all
    end

    case params[:filter]
    when "customer"
      @orders = Order.filter_by_customer
    when "desc"
      @orders = Order.filter_by_desc
    when "asc"
      @orders = Order.filter_by_asc
    when "status_active"
      @orders = Order.filter_by_status_active
    when "status_done"
      @orders = Order.filter_by_status_done
    end

    respond_to do |format|
      format.html
      format.xlsx do
        render xlsx: 'orders', template: 'orders/orders_list'
      end
    end
  end

  def show
    @mechanic = Mechanic.find_by(id: @order.mechanic_id)
    @services = @order.services
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_url(@order), notice: "Заказ успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_url(@order), notice: "Данные обновлены"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Заказ успешно удален"
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:status, :created_at, :customer, :mechanic_id, service_ids: [])
    end
end
