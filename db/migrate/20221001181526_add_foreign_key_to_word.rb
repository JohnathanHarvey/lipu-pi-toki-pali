class AddForeignKeyToWord < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :words, :conlangs
  end
end
