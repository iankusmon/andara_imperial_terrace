class AddPaymentReceiptToNup < ActiveRecord::Migration[8.0]
  def up
    add_column :nups, :payment_receipt_url, :string
  end

  def down
    remove_column :nups, :payment_receipt_url
  end

end
