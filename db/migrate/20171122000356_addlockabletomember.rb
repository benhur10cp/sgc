class Addlockabletomember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :failed_attempts, :integer, default: 0
    add_column :members, :locked_at, :datetime
  end
end
