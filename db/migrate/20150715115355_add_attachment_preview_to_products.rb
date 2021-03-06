class AddAttachmentPreviewToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :products, :preview
  end
end
