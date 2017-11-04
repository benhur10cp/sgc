class CreateLivroCaixas < ActiveRecord::Migration[5.1]
  def change
    create_table :livro_caixas do |t|

      t.timestamps
    end
  end
end
