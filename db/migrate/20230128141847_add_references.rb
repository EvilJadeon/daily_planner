class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :boards, :user, foreign_key: true
    add_reference :tasks, :board, foreign_key: true
  end
end
