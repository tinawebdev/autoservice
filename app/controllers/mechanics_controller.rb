class MechanicsController < ApplicationController
  before_action :set_mechanic, only: %i[ show edit update destroy ]

  def index
    @mechanics = Mechanic.all
  end

  def show
  end

  def new
    @mechanic = Mechanic.new
  end

  def edit
  end

  def create
    @mechanic = Mechanic.new(mechanic_params)
    if @mechanic.save
      redirect_to mechanic_url(@mechanic), notice: "Исполнитель успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mechanic.update(mechanic_params)
      redirect_to mechanic_url(@mechanic), notice: "Данные обновлены"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mechanic.destroy
    redirect_to mechanics_url, notice: "Исполнитель успешно удален"
  end

  private
    def set_mechanic
      @mechanic = Mechanic.find(params[:id])
    end

    def mechanic_params
      params.require(:mechanic).permit(:name)
    end
end
