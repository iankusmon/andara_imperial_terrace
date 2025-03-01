class KprSerializer < ActiveModel::Serializer
  attributes  :id,
              :kpr_id,
              :customer_id,
              :customer_name,
              :nik,
              :mobile,
              :customer_address,
              :nup_number,
              :booking_fee_status,
              :url_spkb_document,
              :down_payment_status,
              :bank,
              :filing_date,
              :submission_status,
              :loan_amount,
              :tenor_period,
              :monthly_installments,
              :due_date,
              :note,
              :kpr_payment_status
end
