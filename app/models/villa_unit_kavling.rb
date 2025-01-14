class VillaUnitKavling < ApplicationRecord

  # Enumerations
  enum :payment_status,{
    done_paid: 0,
    in_process: 1,
    has_been_rejected: 2
  }

  enum :availability_status,{
    has_been_selected: 0,
    not_yet_selected: 1
  }

  enum :kavling_type,{
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
end