class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.text :content
      t.references :case

      t.timestamps
    end
  end
end
