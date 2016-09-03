class Message < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_attached_file :image, styles: { medium: "600x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
