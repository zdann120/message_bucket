class AddTitleToBuckets < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :title, :string
  end
end
