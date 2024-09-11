class DeletedMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :deleted_at, :datetime
    add_index :microposts, :deleted_at
  end
end
