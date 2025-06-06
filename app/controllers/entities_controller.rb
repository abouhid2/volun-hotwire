class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.active
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
        format.turbo_stream
        format.html { redirect_to entities_path, notice: "Entity created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@entity)}_form", partial: "form", locals: { entity: @entity }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.turbo_stream
        format.html { redirect_to entities_path, notice: "Entity updated." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@entity)}_form", partial: "form", locals: { entity: @entity }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.soft_delete
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to entities_path, notice: "Entity deleted." }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :email)
  end
end 