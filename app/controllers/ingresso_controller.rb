class IngressoController < ApplicationController

  def index
    @ingressos = Ingresso.all
  end

  def print
    quantidade = params[:quantidade].to_i
    @ingressos = []
    if Tipo.exists?(params[:tipo_id]) and quantidade < 50
      quantidade.times do |i|
        ingresso = Ingresso.create(tipo_id: params[:tipo_id])
        @ingressos << ingresso
      end
    end

    render :pdf => "ingressos",
             :template => '/ingresso/print.pdf.erb',
             #:show_as_html => true,
             :page_size  => "A4",
             :dpi => '300',
             #:save_to_file => Rails.root.join('pdfs', "teste.pdf"),
             #:save_only => true,
             :layout => 'pdf'

  end

  def new
    @ingresso = Ingresso.new
    @resumo = Ingresso.group(:tipo).count
  end

  def create
    quantidade = params[:quantidade].to_i

    unless quantidade > 50
      @ingressos = []
      for i in 1..quantidade
        ingresso = Ingresso.create(ingresso_params)
        @ingressos << ingresso
      end

      render :pdf => "ingressos",
               :template => '/ingresso/print.pdf.erb',
               :page_size  => "A4",
               :dpi => '300',
               :layout => 'pdf'
    else
      @ingresso = Ingresso.new
      @resumo =  Ingresso.group(:tipo).count
      render "new"
    end

  end

  def authorize
    @ingresso = Ingresso.find(params[:id])
    @ingresso.authorize
  end

  private
  def ingresso_params
    params.require(:ingresso).permit(:tipo_id)
  end

end
