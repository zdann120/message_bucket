class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :bucket, foreign_key: true
      t.integer :priority
      t.text :message
      t.string :token

      t.timestamps
    end
    add_index :messages, :token, unique: true
  end
end
