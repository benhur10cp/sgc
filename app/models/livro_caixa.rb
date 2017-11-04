class LivroCaixa < ApplicationRecord
  belongs_to :tipo_movimentacao
  validates_presence_of :descricao, :valor, :tipo_movimentacao_id

  # gem money-rails
  monetize :valor_cents
end
