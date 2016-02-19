class CreateGitstats < ActiveRecord::Migration
  def change
    create_table :gitstats do |t|
      t.string :nickname
      t.string :current_streak

      t.timestamps null: false
    end
  end
end
