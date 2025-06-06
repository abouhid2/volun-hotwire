class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.active.order(created_at: :desc)
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
        format.html { redirect_to @entity, notice: "Entity was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Entity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: "Entity was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Entity was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.soft_delete

    respond_to do |format|
      format.html { redirect_to entities_url, notice: "Entity was successfully removed." }
      format.turbo_stream { flash.now[:notice] = "Entity was successfully removed." }
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