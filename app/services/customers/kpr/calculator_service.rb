module Customers
  module Kpr
    # Build Calculator for KPR
    class CalculatorService

      def self.execute(
        property_price:,
        down_payment_percentage:,
        tenor_period:,
        fixed_rate:,
        fixed_rate_period:,
        floating_rate:,
        floating_rate_period:
      )

        # Initilaize static data
        kpr_data =  {}

        # Pinjaman Pokok && Dowb Payment
        down_payment = (down_payment_percentage.to_f/100) * property_price
        pinjaman_pokok = property_price - down_payment

        # Masa Fixed rate
        fixed_rate_in_float = (fixed_rate.to_f)/100
        rasio_untuk_fixed_rate = ((1 + (fixed_rate.to_f)/12/100.ceil)) ** (-tenor_period*12)

        angsuran_bulanan_masa_fixed = ( (pinjaman_pokok * fixed_rate.to_f/12/100.ceil) / (1 - (rasio_untuk_fixed_rate)) )
        total_angsuran_masa_fixed = angsuran_bulanan_masa_fixed.ceil * 12 * fixed_rate_period

        sisa_pinjaman_setelah_masa_fixed = (pinjaman_pokok * 101 / 100) / (1 + (fixed_rate_in_float/12)) ** (12*(tenor_period - fixed_rate_period))
        pokok_terbayar_di_masa_fixed = pinjaman_pokok - sisa_pinjaman_setelah_masa_fixed
        bayar_bunga_di_masa_fixed = total_angsuran_masa_fixed - pokok_terbayar_di_masa_fixed

        # Masa Floating rate
        floating_rate_in_float = (floating_rate.to_f)/100
        rasio_untuk_floating_rate = ((1 + (floating_rate.to_f)/12/100.ceil)) ** (-tenor_period*12)

        angsuran_bulanan_masa_floating = ( (sisa_pinjaman_setelah_masa_fixed * floating_rate.to_f/12/100.ceil) / (1 - (rasio_untuk_floating_rate)) )
        total_angsuran_masa_floating = angsuran_bulanan_masa_floating * 12 * floating_rate_period

        pokok_terbayar_di_masa_floating = sisa_pinjaman_setelah_masa_fixed
        bayar_bunga_di_masa_floating = total_angsuran_masa_floating - pokok_terbayar_di_masa_floating

        # Conclude Nominal End Tenor
        total_bayar_pokok = property_price
        estimasi_bunga_pinjaman = bayar_bunga_di_masa_fixed + bayar_bunga_di_masa_floating
        total_biaya_rumah = total_bayar_pokok + estimasi_bunga_pinjaman # Pokok + Bunga
        rasio_bunga_dan_pinjaman_pokok = estimasi_bunga_pinjaman / total_bayar_pokok # In percentage

        # Assign the data kpr_data hash
        kpr_data[:pinjaman_pokok] = pinjaman_pokok.ceil.to_i
        kpr_data[:uang_muka] = down_payment.ceil.to_i
        kpr_data[:angsuran_bulanan_masa_fixed] = angsuran_bulanan_masa_fixed.ceil.to_i
        kpr_data[:angsuran_bulanan_masa_floating] = angsuran_bulanan_masa_floating.ceil.to_i
        kpr_data[:estimasi_bunga_pinjaman] = estimasi_bunga_pinjaman.ceil.to_i
        kpr_data[:biaya_lain_lain] = (6.to_f/100 * pinjaman_pokok).ceil.to_i # Persiapan Akad KPR, meliputi; biaya bank, biaya notaris, dan asuransi (rataan 6% dari pinjaman pokok, beda-beda tiap bank)
        kpr_data[:rasio_bunga_dan_pinjaman_pokok] = rasio_bunga_dan_pinjaman_pokok
        kpr_data[:total_pinjaman] = total_biaya_rumah.ceil.to_i
        

        return kpr_data
      end

    end
  end
end

