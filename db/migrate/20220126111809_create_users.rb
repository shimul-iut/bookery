class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :company_email
      t.string :company_id
      t.string :company_role, null:true
      t.string :phone

      t.timestamps
    end
  end
end
