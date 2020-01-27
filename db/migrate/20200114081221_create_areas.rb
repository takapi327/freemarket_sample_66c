class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|

      t.integer     :name,     null:false,   default: 0         #配送元県名

      t.timestamps
    end
  end
end
