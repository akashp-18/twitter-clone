class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :content
      t.integer :status, null: false, default: 0
      t.timestamps
      t.references :user, foreign_key: true, index: true
    end
  end
end
