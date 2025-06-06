class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.all
  end

  def show
  end

  def new
    @entity = Entity.new
  end

  def edit
  end

  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.turbo_stream { render turbo_stream: turbo_stream.append("entities", partial: "entities/entity", locals: { entity: @entity }) }
        format.html { redirect_to entity_path(@entity), notice: "Entity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@entity, partial: "entities/entity", locals: { entity: @entity }) }
        format.html { redirect_to entity_path(@entity), notice: "Entity was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@entity) }
      format.html { redirect_to entities_path, notice: "Entity was successfully deleted." }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :description, :logo_url, :website, :address, :phone, :email)
  end
end
