class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :type
      t.integer :group_id
      t.integer :user_id
      t.string :duration

      t.timestamps
    end
  end
end
