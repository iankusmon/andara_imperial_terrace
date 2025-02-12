class CreateAgentAffiliates < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_affiliates do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.string  :photo_profile_url
      t.string  :mobile, null: false
      t.string  :referral_code, null: false
      t.datetime :last_login_at
      t.string  :full_name
      t.string  :nik, null: false
      t.string  :occupation
      t.integer :age
      t.string  :gender
      t.string  :married_status
      t.string  :education
      t.string  :salary_range
      t.text    :address
      t.string  :emergency_email
      t.string  :emergency_mobile_number
      t.text    :emergency_address
      t.bigint  :affiliated_customer_id
      t.bigint  :commission_id
      t.bigint  :reward_id
      t.bigint  :revenue_id
      t.decimal :signup_reward, default: 500000, precision: 15, scale: 2
      t.boolean :reward_eligible, default: false
      
      t.timestamps
    end

    add_index :agent_affiliates, :email, unique: true
    add_index :agent_affiliates, :mobile, unique: true
    add_index :agent_affiliates, :referral_code, unique: true
    add_index :agent_affiliates, :nik, unique: true
  end
end
