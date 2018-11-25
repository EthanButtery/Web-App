class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.integer :user_id
      t.string :term
      t.integer :year
      t.integer :total_credits

      t.timestamps
    end
  end
end
