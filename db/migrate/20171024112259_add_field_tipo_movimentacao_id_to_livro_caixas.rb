class AddFieldTipoMovimentacaoIdToLivroCaixas < ActiveRecord::Migration[5.1]
  def change
    add_reference :livro_caixas, :tipo_movimentacao, index: true, foreign_key: true
  end
end
