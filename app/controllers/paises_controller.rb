class PaisesController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@paises = Pais.all
    @paises = Pais.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @paises }
    end
  end

  def show
    @pais = Pais.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @pais }
    end
  end

  def new
    @pais = Pais.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @pais }
    end
  end

  def edit
    @pais = Pais.find(params[:id])
  end

  def create
    @pais = Pais.new(params[:pais])
    respond_to do |format|
      if @pais.save
        format.html { redirect_to(@pais, :notice => 'Pais creado satisfactoriamente') }
        format.xml  { render :xml => @pais, :status => :created, :location => @pais }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pais.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @pais = Pais.find(params[:id])
    respond_to do |format|
      if @pais.update_attributes(params[:pais])
        format.html { redirect_to(@pais, :notice => 'Pais actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pais.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @pais = Pais.find(params[:id])
    @pais.destroy
    respond_to do |format|
      format.html { redirect_to(paises_url) }
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
