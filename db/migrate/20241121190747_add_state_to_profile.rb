class AddStateToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :state, :string
  end
end
