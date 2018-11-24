class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.integer :user_id
      t.string :type
      t.string :year

      t.timestamps
    end
  end
end
