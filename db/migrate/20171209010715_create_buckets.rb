class CreateBuckets < ActiveRecord::Migration[5.1]
  def change
    create_table :buckets do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.string :access_code

      t.timestamps
    end
    add_index :buckets, :token, unique: true
    add_index :buckets, :access_code, unique: true
  end
end
