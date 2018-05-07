require_dependency "datatable_state/application_controller"

module DatatableState
  class StoreController < ApplicationController
    respond_to :json
    before_action :get_state

    def save
      if @store
        @store.update_attributes(store_params)
      else
        @store = Store.new(store_params)
        @store.user = current_user
      end

      respond_to do |format|
        if @store.save
          format.json { render json: @store, status: :created }
        else
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    end

    def load
      result = if @store
        @store.state
      else
        {}.as_json
      end
      respond_to do |format|
        format.json { render json: result }
      end
    end

    private

    def get_state
      return false unless current_user
      @store = Store.find_by_user_id_and_path(current_user.id,
        params[:datatable_state][:path])
    end

    def store_params
      begin
        params.require(:datatable_state).permit(:path, :state)
      rescue
        params[:datatable_state]
      end
    end
  end
end
