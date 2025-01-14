class VillaUnit < ApplicationRecord

    self.inheritance_column = nil
    # Enumerations
    enum :payment_status, { pending: 0, approved: 1, in_progress: 2 }
    enum :drop_point_status, { unpaid: 0, paid: 1 }
    enum :booking_fee_status, { not_paid: 0, been_paid: 1 }
    enum :villa_type, { 
      athena_height: 0, 
      davinci_residence: 1,
      amsterdam_royale: 2,
			versailles_mansion: 3,
			barcelona_estate: 4,
			vienna_classic: 5,
			monaco_elite: 6,
			kaiser_residence: 7,
			prague_palace: 8,
			florence_heritage: 9,
			danish_residence: 10,
			swiss_horizon: 11,
			porto_vista: 12,
			stockholm_serenity: 13,
			rome_royale: 14
    }
    enum :availability_status, { sold: 0, available: 1 }
    enum :eiffel_room_type,{
      eiffel_suite: 0,
      eiffel_president_suite: 1,
      eiffel_deluxe_suite: 2,
      eiffel_penthouse: 3
    }

    enum :venice_room_type,{
      venice_suite: 0,
      venice_president_suite: 1,
      venice_deluxe_suite: 2
    }

    enum :floor_type,{
      two_floor: 0,
      three_floor: 1
    }

    enum :villa_theme,{
      the_royale_elegance: 0,
      the_continental_estate: 1,
      the_imperial_palace: 2,
      the_grand_horizon: 3,
      the_prestige_crown: 4
    }
end
