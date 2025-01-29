class RenameTableWisateModernBanners < ActiveRecord::Migration[8.0]
  def up
    rename_table :wisate_modern_banners, :wisata_modern_banners
  end

  def down
    rename_table :wisata_modern_banners, :wisate_modern_banners
  end
end
