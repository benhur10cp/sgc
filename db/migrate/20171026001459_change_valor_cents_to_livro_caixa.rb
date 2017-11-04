class ChangeValorCentsToLivroCaixa < ActiveRecord::Migration[5.1]
  def change
    change_column :livro_caixas, :valor_cents, :integer, limit: 8
  end
end
