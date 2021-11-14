class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show

  end

  def edit
  end

  def update
    raise
  end

  def new
    @equipment = Equipment.new
  end

  def create
    equipment = Equipment.new(equipment_params)
    if equipment.save
      redirect_to equipments_path
    else
      render :new
    end
  end

  def destroy
    Equipment.delete(params[:id])
    redirect_to equipments_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :how_to_use, :brand)
  end
end
