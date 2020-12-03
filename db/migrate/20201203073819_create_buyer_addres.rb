class CreateBuyerAddres < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addres do |t|

      t.timestamps
    end
  end
end
