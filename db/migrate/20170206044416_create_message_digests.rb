class CreateMessageDigests < ActiveRecord::Migration[5.0]
  def change
    create_table :message_digests do |t|
      t.text :digest
      t.string :message

      t.timestamps
    end
  end
end
