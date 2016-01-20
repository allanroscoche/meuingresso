class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nome, null: false
      t.string :descricao
      t.decimal :valor, :precision => 8, :scale => 2, null: false

    end
  end
end
