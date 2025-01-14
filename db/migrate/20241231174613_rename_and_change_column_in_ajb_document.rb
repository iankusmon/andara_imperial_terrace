class RenameAndChangeColumnInAjbDocument < ActiveRecord::Migration[8.0]
  def change
    # Ubah nama kolom dari scan_ppjb_document menjadi upload_ppjb_doc
    rename_column :ajb_documents, :scan_ajb_document, :upload_ajb_doc

    # Ubah tipe data kolom upload_ppjb_doc menjadi binary
    change_column :ajb_documents, :upload_ajb_doc, :binary
  end
end
