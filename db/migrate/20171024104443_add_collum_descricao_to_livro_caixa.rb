class AddCollumDescricaoToLivroCaixa < ActiveRecord::Migration[5.1]
  def change
    add_column :livro_caixas, :descricao, :string
    add_column :livro_caixas, :situacao, :boolean, default: false
    add_column :livro_caixas, :valor, :decimal, precision: 12, scale: 2
  end
end
