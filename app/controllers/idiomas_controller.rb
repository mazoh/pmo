class IdiomasController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@idiomas = Idioma.all
    @idiomas = Idioma.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @idiomas }
    end
  end

  def show
    @idioma = Idioma.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @idioma }
    end
  end

  def new
    @idioma = Idioma.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @idioma }
    end
  end

  def edit
    @idioma = Idioma.find(params[:id])
  end

  def create
    @idioma = Idioma.new(params[:idioma])
    respond_to do |format|
      if @idioma.save
        format.html { redirect_to(@idioma, :notice => 'Idioma creado satisfactoriamente') }
        format.xml  { render :xml => @idioma, :status => :created, :location => @idioma }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idioma.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @idioma = Idioma.find(params[:id])
    respond_to do |format|
      if @idioma.update_attributes(params[:idioma])
        format.html { redirect_to(@idioma, :notice => 'Idioma actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idioma.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @idioma = Idioma.find(params[:id])
    @idioma.destroy
    respond_to do |format|
      format.html { redirect_to(idiomas_url) }
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