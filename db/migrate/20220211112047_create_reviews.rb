class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
