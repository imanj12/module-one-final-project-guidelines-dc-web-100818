class AddPriceColumnToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :price, :float
  end
end
