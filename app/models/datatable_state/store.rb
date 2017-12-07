module DatatableState
  class Store < ActiveRecord::Base
    self.table_name = :datatable_states
    belongs_to :user
  end
end
