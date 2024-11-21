class AddCityToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :city, :string
  end
end
