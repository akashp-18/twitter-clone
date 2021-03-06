class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, foreign_key: true, null: false
      t.references :commentable, polymorphic: true
    end
  end
end
