class TitulosController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@titulos = Titulo.all
    @titulos = Titulo.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @titulos }
    end
  end

  def show
    @titulo = Titulo.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @titulo }
    end
  end

  def new
    @titulo = Titulo.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @titulo }
    end
  end

  def edit
    @titulo = Titulo.find(params[:id])
  end

  def create
    @titulo = Titulo.new(params[:titulo])
    respond_to do |format|
      if @titulo.save
        format.html { redirect_to(@titulo, :notice => 'Titulo creado satisfactoriamente') }
        format.xml  { render :xml => @titulo, :status => :created, :location => @titulo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @titulo = Titulo.find(params[:id])
    respond_to do |format|
      if @titulo.update_attributes(params[:titulo])
        format.html { redirect_to(@titulo, :notice => 'Titulo actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @titulo = Titulo.find(params[:id])
    @titulo.destroy
    respond_to do |format|
      format.html { redirect_to(titulos_url) }
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
