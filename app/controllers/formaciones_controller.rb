class FormacionesController < ApplicationController

  before_filter :docente_and_formaciones
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@formaciones = Formacion.all
    @formaciones = @docente.formaciones.find(:all)
    #@formaciones = @docente.formaciones.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @formaciones }
    end
  end

  def show

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @formacion }
    end
  end

  def new
    @formacion = Formacion.new
    @titulos = Titulo.all
    @universidades = Universidad.all
    @ciudades = Ciudad.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @formacion }
    end
  end

  def edit
    @titulos = Titulo.all
    @universidades = Universidad.all
    @ciudades = Ciudad.all
  end

  def create
    @formacion = Formacion.new(params[:formacion])
    @formacion.docente_id = @docente.id
    respond_to do |format|
      if @formacion.save
        flash[:notice] = 'Formacion creada satisfactoriamente'
        format.html { redirect_to docente_formaciones_path(@docente) }
        format.xml  { render :xml => @formacion, :status => :created, :location => @formacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @formacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @formacion.update_attributes(params[:formacion])
        flash :notice => 'Formacion actualizada satisfactoriamente'
        format.html { redirect_to docente_formaciones_path(@docente) }
        format.xml  { head :ok }
      else
        @titulos = Titulo.all
        @universidades = Universidad.all
        @ciudades = Ciudad.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @formacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @formacion.destroy

    respond_to do |format|
      format.html { redirect_to docente_formaciones_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_formaciones
    @docente = Docente.find(params[:docente_id])
    @formacion = Formacion.find(params[:id]) if params[:id]
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