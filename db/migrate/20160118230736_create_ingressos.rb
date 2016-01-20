class CreateIngressos < ActiveRecord::Migration
  def change
    create_table :ingressos do |t|
      t.string :code, null: false
      t.datetime :entrada
      t.belongs_to :tipo
      t.timestamps null: false
    end
  end
end
