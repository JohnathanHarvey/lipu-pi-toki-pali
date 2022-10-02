class AddConlangIdToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :conlang_id, :integer
  end
end
