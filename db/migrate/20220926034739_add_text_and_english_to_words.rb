class AddTextAndEnglishToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :text, :string
    add_column :words, :english, :string
  end
end
