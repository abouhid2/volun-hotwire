class EventsController < ApplicationController
  before_action :set_entity
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = @entity.events
  end

  def show
  end

  def new
    @event = @entity.events.build
  end

  def edit
  end

  def create
    @event = @entity.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.turbo_stream { render turbo_stream: turbo_stream.append("events", partial: "events/event", locals: { event: @event }) }
        format.html { redirect_to entity_event_path(@entity, @event), notice: "Event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@event, partial: "events/event", locals: { event: @event }) }
        format.html { redirect_to entity_event_path(@entity, @event), notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@event) }
      format.html { redirect_to entity_events_path(@entity), notice: "Event was successfully deleted." }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:entity_id])
  end

  def set_event
    @event = @entity.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :location)
  end
end
