class NupSerializer < ActiveModel::Serializer
  attributes :id,
             :nup_number,
             :order_number,
             :fullname,
             :nik,
             :occupation,
             :scan_ktp_url,
             :payment_receipt_url,
             :package,
             :villa_desired,
             :payment_method,
             :address,
             :status,
             :note
end
