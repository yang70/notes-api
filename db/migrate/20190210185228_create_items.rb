class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :note
      t.string     :title
      t.datetime   :completed_on

      t.timestamps
    end
  end
end
