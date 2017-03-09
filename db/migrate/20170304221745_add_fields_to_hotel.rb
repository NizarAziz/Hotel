class AddFieldsToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :name, :string
    add_column :hotels, :description, :string
    add_column :hotels, :location, :string
    add_column :hotels, :user_id, :integer
  end
end
