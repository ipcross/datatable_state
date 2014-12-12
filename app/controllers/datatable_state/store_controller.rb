require_dependency "datatable_state/application_controller"

module DatatableState
  class StoreController < ApplicationController
    respond_to :json
    before_filter :get_state

    def save
      if @store
        @store.update_attributes(params[:datatable_state])
      else
        @store = Store.new(params[:datatable_state])
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
      respond_with result
    end

    private

    def get_state
      @store = Store.find_by_user_id_and_path(current_user.id,
        params[:datatable_state][:path])
    end
  end
end
