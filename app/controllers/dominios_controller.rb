class DominiosController < ApplicationController

  before_filter :docente_and_dominios
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @dominios = @docente.dominios.find(:all)
    #@dominios = @docente.dominios.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @dominios }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @dominio }
    end
  end

  def new
    @dominio = Dominio.new
    @idiomas = Idioma.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @dominio }
    end
  end

  def edit
    @idiomas = Idioma.all
  end

  def create
    @dominio = Dominio.new(params[:dominio])
    @dominio.docente_id = @docente.id
    respond_to do |format|
      if @dominio.save
        flash[:notice] = 'Dominio creado satisfactoriamente'
        format.html { redirect_to docente_dominios_path(@docente) }
        format.xml  { render :xml => @dominio, :status => :created, :location => @dominio }
      else
        @idiomas = Idioma.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @dominio.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dominio.update_attributes(params[:dominio])
        flash[:notice] = 'Dominio actualizado satisfactoriamente'
        format.html { redirect_to docente_dominios_path(@docente) }
        format.xml  { head :ok }
      else
        @idiomas = Idioma.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dominio.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @dominio.destroy
    respond_to do |format|
      format.html { redirect_to docente_dominios_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_dominios
    @docente = Docente.find(params[:docente_id])
    @dominio = Dominio.find(params[:id]) if params[:id]
   end

  private
  def determine_layout
     if ['index'].include?(action_name)
        "application"
     else
        "basico"
     end
  end
end