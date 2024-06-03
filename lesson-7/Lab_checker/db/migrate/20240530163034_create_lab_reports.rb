class CreateLabReports < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_reports do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :grade

      t.timestamps
    end
  end
end
