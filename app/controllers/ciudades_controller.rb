class CiudadesController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@ciudades = Ciudad.all
    @ciudades = Ciudad.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @ciudades }
    end
  end

  def show
    @ciudad = Ciudad.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @ciudad }
    end
  end

  def new
    @ciudad = Ciudad.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @ciudad }
    end
  end

  def edit
    @ciudad = Ciudad.find(params[:id])
  end

  def create
    @ciudad = Ciudad.new(params[:ciudad])
    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to(@ciudad, :notice => 'Ciudad creada satisfactoriamente') }
        format.xml  { render :xml => @ciudad, :status => :created, :location => @ciudad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ciudad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ciudad = Ciudad.find(params[:id])

    respond_to do |format|
      if @ciudad.update_attributes(params[:ciudad])
        format.html { redirect_to(@ciudad, :notice => 'Ciudad actualizada satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ciudad.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ciudad = Ciudad.find(params[:id])
    @ciudad.destroy

    respond_to do |format|
      format.html { redirect_to(ciudades_url) }
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