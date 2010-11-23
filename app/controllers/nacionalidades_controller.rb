class NacionalidadesController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@nacionalidades = Nacionalidad.all
    @nacionalidades = Nacionalidad.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @nacionalidades }
    end
  end

  def show
    @nacionalidad = Nacionalidad.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @nacionalidad }
    end
  end

  def new
    @nacionalidad = Nacionalidad.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @nacionalidad }
    end
  end

  def edit
    @nacionalidad = Nacionalidad.find(params[:id])
  end

  def create
    @nacionalidad = Nacionalidad.new(params[:nacionalidad])
    respond_to do |format|
      if @nacionalidad.save
        format.html { redirect_to(@nacionalidad, :notice => 'Nacionalidad creada satisfactoriamente') }
        format.xml  { render :xml => @nacionalidad, :status => :created, :location => @nacionalidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nacionalidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @nacionalidad = Nacionalidad.find(params[:id])
    respond_to do |format|
      if @nacionalidad.update_attributes(params[:nacionalidad])
        format.html { redirect_to(@nacionalidad, :notice => 'Nacionalidad actualizada satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nacionalidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @nacionalidad = Nacionalidad.find(params[:id])
    @nacionalidad.destroy
    respond_to do |format|
      format.html { redirect_to(nacionalidades_url) }
      format.xml  { head :ok }
    end
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
