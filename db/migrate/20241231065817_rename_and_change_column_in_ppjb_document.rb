class RenameAndChangeColumnInPpjbDocument < ActiveRecord::Migration[8.0]
  def change
    # Ubah nama kolom dari scan_ppjb_document menjadi upload_ppjb_doc
    rename_column :ppjb_documents, :scan_ppjb_document, :upload_ppjb_doc

    # Ubah tipe data kolom upload_ppjb_doc menjadi binary
    change_column :ppjb_documents, :upload_ppjb_doc, :binary
  end
end
