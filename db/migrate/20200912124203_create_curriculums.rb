class CreateCurriculums < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculums do |t|
      t.datetime :entry_date
      t.string :name
      t.integer :hours_done
      t.integer :hours_target
      t.integer :modules_done
      t.integer :modules_target
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
