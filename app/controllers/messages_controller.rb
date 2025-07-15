class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    # 9. Order messages by creation time for consistent display
    @messages = Message.all.order(created_at: :desc)
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        # 10. Redirect to messages index instead of show page
        format.html { redirect_to messages_path, notice: "Message was successfully created." }
        # 11. Add Turbo Stream format - this is used when the form is submitted with Turbo
        format.turbo_stream
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        # 12. Redirect to messages index instead of show page
        format.html { redirect_to messages_path, notice: "Message was successfully updated." }
        # 13. Add Turbo Stream format
        format.turbo_stream
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
      # 14. Add Turbo Stream format
      format.turbo_stream
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      # 15. Fix typo in params.expect to params.require
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      # 16. Fix typo in params.expect to params.require
      params.require(:message).permit(:content)
    end
end
