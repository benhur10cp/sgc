class AddValorToLivroCaixa < ActiveRecord::Migration[5.1]
  def change
    add_column :livro_caixas, :valor, :integer, default: 0
  end
end
