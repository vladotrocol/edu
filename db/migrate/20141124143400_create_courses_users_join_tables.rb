class CreateCoursesUsersJoinTables < ActiveRecord::Migration
  def up
    create_table :courses_users do |t|
	  t.integer :course_id
      t.integer :user_id
      t.timestamps
    end
    add_index :courses_users, [:course_id, :user_id]
  end
  def self.down
    drop_table :courses_users
  end
end
