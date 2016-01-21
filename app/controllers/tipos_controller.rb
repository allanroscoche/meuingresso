class TiposController < ApplicationController
  def index
    @tipos = Tipo.all
  end

  def new
    @tipo = Tipo.new
  end

  def create
    @tipo = Tipo.create(params_tipo)
    redirect_to action: "index"
  end

  def destroy
    @tipo = Tipo.find(params[:id])
    if Ingresso.where(tipo_id: @tipo.id).blank?
      @tipo.destroy
    end
    redirect_to action: "index"
  end

  def edit
    @tipo = Tipo.find(params[:id])
  end

  def update
    @tipo = Tipo.find(params[:id])
    @tipo.update(params_tipo)
    redirect_to action: "index"
  end

  private
  def params_tipo
    params.require(:tipo).permit(:nome,:valor)
  end
end
