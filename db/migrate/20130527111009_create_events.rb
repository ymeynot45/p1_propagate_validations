class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :organizer_name, :organizer_email, :title, null: false
      t.date :date, null: false
    end
  end
end
