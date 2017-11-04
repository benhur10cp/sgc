class RemoveValorToLivroCaixa < ActiveRecord::Migration[5.1]
  def change
    remove_column :livro_caixas, :valor
  end
end
