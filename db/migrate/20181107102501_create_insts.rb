class CreateInsts < ActiveRecord::Migration[5.1]
  def change
    create_table :insts do |t|
      t.string :title
      t.text :content
      t.text :image
    end
  end
end
