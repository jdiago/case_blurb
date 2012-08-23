class AddCaseIdToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :case_id, :integer
  end
end
