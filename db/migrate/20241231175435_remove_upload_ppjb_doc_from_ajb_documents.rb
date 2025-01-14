class RemoveUploadPpjbDocFromAjbDocuments < ActiveRecord::Migration[8.0]
  def change
    remove_column :ajb_documents, :upload_ppjb_doc, :string
  end
end
