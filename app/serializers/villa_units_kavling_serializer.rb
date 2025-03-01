class VillaUnitsKavlingSerializer < ActiveModel::Serializer
  attributes :id,
             :kavling_id,
             :nup_id,
             :booking_fee_id,
             :down_payment_id,
             :pelunasan_id,
             :approved_by,
             :description,
             :payment_status,
             :kavling_type,
             :availability_status,
             :street_address,
             :price,
             :surface_area,
             :building_area
end