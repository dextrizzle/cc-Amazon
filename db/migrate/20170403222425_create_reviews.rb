class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.text :body
      t.timestamps null: false
    end
  end
end
