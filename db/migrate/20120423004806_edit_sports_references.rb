class EditSportsReferences < ActiveRecord::Migration
	def self.up
		rename_column :sports, :author_id_id, :sports_category_id
	end

	def self.down
		rename_column :sports, :sports_category_id, :author_id_id
	end
end
