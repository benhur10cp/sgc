class AddValorCentsToLivroCaixa < ActiveRecord::Migration[5.1]
  def change
    add_column :livro_caixas, :valor_cents, :integer, default: 0
  end
end
