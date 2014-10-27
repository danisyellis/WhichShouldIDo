class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :todo_list, index: true
      t.string :content

      t.timestamps
    end
  end
end
