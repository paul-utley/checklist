class Api::V1::ListItemController < ApplicationController
    before_action :set_list_item, :except => [:index, :create]
    before_action :user_login
    #GET /list-item
    #GET /list-item.json
    def index
        @list_items = ListItem.where('user_id = ?', session[:user_id]).find_each
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

  # POST /list-item
  # POST /list-item.json
  def create
    @list_item = ListItem.new(list_item_params.merge(:user_id => session[:user_id]))


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

    def user_login
      unless helpers.logged_in?
        render status: 401, json: {"error": "UNAUTHORIZED"}
      end
    end
end
