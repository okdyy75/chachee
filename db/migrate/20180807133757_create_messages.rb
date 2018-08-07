class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :ssid, null: false
      t.text :msg, null: false

      t.timestamps
    end
  end
end
