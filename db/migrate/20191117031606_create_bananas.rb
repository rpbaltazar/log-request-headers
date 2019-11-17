class CreateBananas < ActiveRecord::Migration[6.0]
  def change
    create_table :bananas do |t|

      t.timestamps
    end
  end
end
