class AddAttachmentImageToLiderancas < ActiveRecord::Migration
  def self.up
    change_table :liderancas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :liderancas, :image
  end
end
