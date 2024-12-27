class PpjbDocumentSerializer < ActiveModel::Serializer
  attributes  :id,
              :ppjb_number,
              :booking_fee_number,
              :down_payment_number,
              :order_number,
              :villa_booked_unit,
              :villa_booked_cluster,
              :villa_booked_street,
              :fullname,
              :nik,
              :occupation,
              :status,
              :documentation_photo
end
