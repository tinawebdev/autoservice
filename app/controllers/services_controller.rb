class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to service_url(@service), notice: "Услуга успешно создана."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      redirect_to service_url(@service), notice: "Данные обновлены"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_url, notice: "Услуга успешно удалена"
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :category_id)
    end
end
