class InvestigacionesController < ApplicationController

  before_filter :docente_and_investigaciones
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    @investigaciones = @docente.investigaciones.find(:all)
    #@investigaciones = @docente.investigaciones.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @investigaciones }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @investigacion }
    end
  end

  def new
    @investigacion = Investigacion.new
    @universidades = Universidad.all
    @ciudades = Ciudad.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @investigacion }
    end
  end

  def edit
    @universidades = Universidad.all
    @ciudades = Ciudad.all
  end

  def create
    @investigacion = Investigacion.new(params[:investigacion])
    @investigacion.docente_id = @docente.id
    respond_to do |format|
      if @investigacion.save
        flash[:notice] = 'Investigacion creada satisfactoriamente'
        format.html { redirect_to docente_investigaciones_path(@docente) }
        format.xml  { render :xml => @investigacion, :status => :created, :location => @investigacion }
      else
        @universidades = Universidad.all
        @ciudades = Ciudad.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @investigacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investigacion.update_attributes(params[:investigacion])
        flash[:notice] = 'Investigacion actualizada satisfactoriamente'
        format.html { redirect_to docente_investigaciones_path(@docente) }
        format.xml  { head :ok }
      else
        @universidades = Universidad.all
        @ciudades = Ciudad.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @investigacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @investigacion.destroy
    respond_to do |format|
      format.html { redirect_to docente_investigaciones_path(@docente) }
      format.xml  { head :ok }
    end
  end

  protected
   def docente_and_investigaciones
    @docente = Docente.find(params[:docente_id])
    @investigacion = Investigacion.find(params[:id]) if params[:id]
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
