class CreateDatatableStates < ActiveRecord::Migration
  def change
    create_table :datatable_states do |t|
      t.references :user, index: true
      t.string :path, index: true
      t.text :state

      t.timestamps null: false
    end
    add_index :datatable_states, [:user_id, :path], unique: true
  end
end
