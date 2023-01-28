class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.datetime :appointed_day

      t.timestamps
    end
  end
end
