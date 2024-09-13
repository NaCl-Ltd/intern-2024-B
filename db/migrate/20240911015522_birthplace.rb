class Birthplace < ActiveRecord::Migration[7.0]
  def change
    create_table :Places do |t|
      t.integer :birthplace, null: false, default: 0
    end
  end
end
