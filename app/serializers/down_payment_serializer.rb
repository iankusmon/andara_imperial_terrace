class DownPaymentSerializer < ActiveModel::Serializer
  attributes  :id,
              :down_payment_number,
              :order_number,
              :payment_type,
              :payment_method,
              :payment_amount,
              :tempo_period,
              :fullname,
              :nik,
              :occupation,
              :payment_receipt_url,
              :note
            
end
