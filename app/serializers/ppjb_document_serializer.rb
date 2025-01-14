class PpjbDocumentSerializer < ActiveModel::Serializer
  attributes  :id,
              :ppjb_number,
              :customer_id,
              :customer_name,
              :nik,
              :mobile,
              :villa_unit_type,
              :villa_floor_type,
              :villa_price,
              :order_number,
              :down_payment_status,
              :down_payment_receipt_url,
              :upload_ppjb_doc,
              :upload_status
end
