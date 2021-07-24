class Api::V1::ListItemController < ApplicationController
    before_action :set_list_item, only: [:show, :edit, :update, :destroy]
    #GET /list-item
    #GET /list-item.json
    def index
        @list_items = ListItem.all
        render json: @list_items
    end

    #GET /list-item/1
    # GET /list-item/1.json
    def show
        if @list_item
            render json: @list_item
        else
            render json: @list_item.errors
        end
    end

    # GET /list-item/new
  def new
    @list_item = ListItem.new
  end

  # GET /list-item/1/edit
  def edit
  end

  # POST /list-item
  # POST /list-item.json
  def create
    @list_item = ListItem.new(list_item_params)


    if @list_item.save
      render json: @list_item
    else
      render json: @list_item.errors
    end
  end

  # PATCH/PUT /list-item/1
  # PATCH/PUT /list-item/1.json
  def update
  end

  # DELETE /list-item/1
  # DELETE /list-item/1.json
  def destroy
    @list_item.destroy

    render json: { notice: 'List Item was successfully removed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.permit(:label, :group)
    end
end
