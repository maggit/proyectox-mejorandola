class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :city
      t.datetime :greetings_email_sent_at

      t.timestamps
    end
  end
end
