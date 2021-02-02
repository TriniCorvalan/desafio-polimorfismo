class CreatePhysicalProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :physical_products do |t|

      t.timestamps
    end
  end
end
