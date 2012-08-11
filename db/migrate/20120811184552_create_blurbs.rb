class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|

      t.timestamps
    end
  end
end
