Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  root to: 'home#index'

  resources :products

  resources :livro_caixas

  get "/consulta_preco", to: "consulta_precos#index"
  get "/contas_pagar", to: "contas_pagars#index"
  get "/contas_receber", to: "contas_recebers#index"
  get "/nota_fiscal_saida", to: "nota_fiscal_saidas#index"
  get "/nota_fiscal_entrada", to: "nota_fiscal_entradas#index"
  get "/pedido_venda", to: "pedido_vendas#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
