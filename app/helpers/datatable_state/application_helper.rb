module DatatableState
  module ApplicationHelper
    def saved_display_length
      saved_state = Store.find_by_user_id_and_path(current_user.id,
        request.path.split('/').last)
      "data-display-length=#{JSON.parse(saved_state.state)['length']}" if saved_state
    end
  end
end
