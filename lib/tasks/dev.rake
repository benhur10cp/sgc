namespace :dev do

  desc "Setup Development"
  task setup: :environment do

    puts "Executando o setup para desenvolvimento"

    puts "Apagando o BD...#{%x(rake db:drop)}"
    puts "Criando o BD...#{%x(rake db:create)}"
    puts %x(rake db:migrate)
    #puts %x(rake db:seed)
    puts %x(rake dev:generate_tipo_movimentacao)
    puts %x(rake dev:generate_registro_livro_caixa)

    puts "Setup completado"
  end


  desc "Cria Tipo Movimentação Caixa"
  task generate_tipo_movimentacao: :environment do
    puts "Cadastrando tipo movimentação fake..."

    10.times do
      TipoMovimentacao.create!(
          nm_movimentacao: Faker::Lorem.unique.words.first,
          tipo: Random.rand(1..3),
          created_at: Time.at(Time.local(2016, 1, 1) + rand * (Time.local(2017, 7, 1).to_f - Time.local(2016, 1, 1).to_f)),
          updated_at: Time.at(Time.local(2016, 1, 1) + rand * (Time.local(2017, 7, 1).to_f - Time.local(2016, 1, 1).to_f))
      )
    end

    puts "Tipo movimentação cadastrados!"
  end

  desc "Cria registro Livro Caixa"
  task generate_registro_livro_caixa: :environment do
    puts "Cadastrando registros fake..."

    100.times do
      LivroCaixa.create!(
          descricao: Faker::Lorem.sentence,
          #valor: Faker::Number.decimal(Random.rand(1..6), 2),
          valor: "#{Random.rand(1..500)},#{Random.rand(1..99)}",
          tipo_movimentacao_id: TipoMovimentacao.all.sample.id,
          situacao: true,
          created_at: Time.at(Time.local(2016, 1, 1) + rand * (Time.local(2017, 7, 1).to_f - Time.local(2016, 1, 1).to_f)),
          updated_at: Time.at(Time.local(2016, 1, 1) + rand * (Time.local(2017, 7, 1).to_f - Time.local(2016, 1, 1).to_f))
      )
    end

    puts "Rsgistros cadastrados!"
  end

end