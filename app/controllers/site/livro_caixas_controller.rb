class Site::LivroCaixasController < SiteController
  before_action :set_product, only: [:show]
  before_action :lista_para_select, only: [:new, :create]

  def index
    condicao = " 1=1 "
    condicao += " and livro_caixas.created_at::DATE >= '#{params[:data_inicio]}' " if params[:data_inicio].present? and !params[:data_inicio].blank?
    condicao += " and livro_caixas.created_at::DATE <= '#{params[:data_fim]}' " if params[:data_fim].present? and !params[:data_fim].blank?
    @registros_caixa = LivroCaixa.where(condicao).includes(:tipo_movimentacao).references(:tipo_movimentacao).order('livro_caixas.created_at').page(params[:page]).per(10)
  end

  def show

  end

  def new
    @registro_caixa = LivroCaixa.new
  end

  def create
    @registro_caixa = LivroCaixa.new(livro_caixa_params)

    respond_to do |format|
      if @registro_caixa.save
        format.html {redirect_to url: site_livro_caixas_path, notice: 'Registro criado com sucesso'}
      else
        format.html {render :new}
      end
    end
  end

  private

  def lista_para_select
    @tipos_movimentacao = TipoMovimentacao.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_livro_caixa
    @product = LivroCaixa.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def livro_caixa_params
    params.require(:livro_caixa).permit(:descricao, :valor, :tipo_movimentacao_id)
  end

end