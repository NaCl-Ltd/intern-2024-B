class AddPrefecture < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :prefecture, :string
  end
end
