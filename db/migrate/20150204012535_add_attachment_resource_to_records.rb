class AddAttachmentResourceToRecords < ActiveRecord::Migration
  def self.up
    change_table :records do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :records, :resource
  end
end
