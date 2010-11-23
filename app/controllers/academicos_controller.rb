class AcademicosController < ApplicationController

  before_filter :practica_and_academicos
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@academicos = Academico.all
    @academicos = @practica.academicos.find(:all)
    #@academicos = @practica.academicos.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @academicos }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @academico }
    end
  end

  def new
    @academico = Academico.new
    @ciudades = Ciudad.all
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @academico }
    end
  end

  def edit
    @ciudades = Ciudad.all
  end

  def create
    @academico = Academico.new(params[:academico])
    @academico.practica_id = @practica.id
    respond_to do |format|
      if @academico.save
        flash[:notice] = 'Academico creado satisfactoriamente'
        format.html { redirect_to practica_academicos_path(@practica) }
        format.xml  { render :xml => @academico, :status => :created, :location => @academico }
      else
        @ciudades = Ciudad.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @academico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @academico.update_attributes(params[:academico])
        flash[:notice] = 'Academico actualizado satisfactoriamente'
        format.html { redirect_to practica_academicos_path(@practica) }
        format.xml  { head :ok }
      else
        @ciudades = Ciudad.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @academico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @academico.destroy
    respond_to do |format|
      format.html { redirect_to practica_academicos_path(@practica) }
      format.xml  { head :ok }
    end
  end

  protected
   def practica_and_academicos
    @practica = Practica.find(params[:practica_id])
    @academico = Academico.find(params[:id]) if params[:id]
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
