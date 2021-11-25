class ItemServiceJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :items_services, id: false do |t|
      t.belongs_to :service
      t.belongs_to :item
    end
  end
end
