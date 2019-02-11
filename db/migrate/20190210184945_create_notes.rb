class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string   :title
      t.text     :description
      t.datetime :completed_on

      t.timestamps
    end
  end
end
