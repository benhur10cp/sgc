class TipoMovimentacao < ApplicationRecord
  has_many :livro_caixas
  validates_presence_of :nm_movimentacao, :tipo
end
