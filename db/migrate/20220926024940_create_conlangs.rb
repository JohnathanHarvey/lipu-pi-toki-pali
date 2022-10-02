class CreateConlangs < ActiveRecord::Migration[7.0]
  def change
    create_table :conlangs do |t|
      t.string :name

      t.timestamps
    end
  end
end
