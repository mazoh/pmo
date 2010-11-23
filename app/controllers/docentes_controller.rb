class DocentesController < ApplicationController
  
  before_filter :find_docente, :only => [:show, :edit, :update, :destroy]
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@docentes = Docente.all
    @docentes = Docente.search(params[:search])

    #if current_user.role? :admin
    #   @personas = Persona.all
    # else
    #   @personas = Persona.find(:all, :conditions => [ "user_id = ?", current_user.id])
    #end

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @docentes }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @docente }
    end
  end

  def new
    @docente = Docente.new
    @nacionalidades = Nacionalidad.all
    @cargos = Cargo.all
    @centros = Centro.all
    @areas = Area.all
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @docente }
    end
  end

  def edit
    @nacionalidades = Nacionalidad.all
    @cargos = Cargo.all
    @centros = Centro.all
    @areas = Area.all
  end

  def create
    @docente = Docente.new(params[:docente])

    respond_to do |format|
      if @docente.save
        format.html { redirect_to(@docente, :notice => 'docente creado satisfactoriamente') }
        format.xml  { render :xml => @docente, :status => :created, :location => @docente }
      else
        @nacionalidades = Nacionalidad.all
        @cargos = Cargo.all
        @centros = Centro.all
        @areas = Area.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @docente.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @docente.update_attributes(params[:docente])
        format.html { redirect_to(@docente, :notice => 'docente actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        @nacionalidades = Nacionalidad.all
        @cargos = Cargo.all
        @centros = Centro.all
        @areas = Area.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @docente.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @docente.destroy

    respond_to do |format|
      format.html { redirect_to(docentes_url) }
      format.xml  { head :ok }
    end
  end

  private
  def find_docente
   @docente = Docente.find(params[:id])
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
