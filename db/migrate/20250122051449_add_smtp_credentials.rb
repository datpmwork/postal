class AddSMTPCredentials < ActiveRecord::Migration[7.0]
  def change
    # Use raw SQL to position the column after the 'email' column
    execute <<-SQL
      ALTER TABLE smtp_endpoints
      ADD COLUMN user VARCHAR(255) AFTER port,
      ADD COLUMN secret VARCHAR(255) AFTER user
    SQL
  end
end
