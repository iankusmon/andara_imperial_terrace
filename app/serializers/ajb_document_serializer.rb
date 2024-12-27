class AjbDocumentSerializer < ActiveModel::Serializer
  attributes  :id,
              :ajb_number,
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
              :scan_ajb_document,
              :documentation_photo
end
