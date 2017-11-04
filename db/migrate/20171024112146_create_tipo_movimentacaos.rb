class CreateTipoMovimentacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_movimentacaos do |t|
      t.string :nm_movimentacao
      t.integer :tipo

      t.timestamps
    end
  end
end
