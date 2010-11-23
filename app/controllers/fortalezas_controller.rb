class FortalezasController < ApplicationController

  before_filter :practica_and_fortalezas
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@fortalezas = Fortaleza.all
    @fortalezas = @practica.fortalezas.find(:all)
    #@fortalezas = @practica.fortalezas.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fortalezas }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @fortaleza }
    end
  end

  def new
    @fortaleza = Fortaleza.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fortaleza }
    end
  end

  def edit
  end

  def create
    @fortaleza = Fortaleza.new(params[:fortaleza])
    @fortaleza.practica_id = @practica.id
    respond_to do |format|
      if @fortaleza.save
        flash[:notice] = 'Fortaleza creada satisfactoriamente'
        format.html { redirect_to practica_fortalezas_path(@practica) }
        format.xml  { render :xml => @fortaleza, :status => :created, :location => @fortaleza }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fortaleza.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @fortaleza = Fortaleza.find(params[:id])
    respond_to do |format|
      if @fortaleza.update_attributes(params[:fortaleza])
        flash[:notice] = 'Fortaleza actualizada satisfactoriamente'
        format.html { redirect_to practica_fortalezas_path(@practica) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fortaleza.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fortaleza.destroy
    respond_to do |format|
      format.html { redirect_to practica_fortalezas_path(@practica) }
      format.xml  { head :ok }
    end
  end

  protected
   def practica_and_fortalezas
    @practica = Practica.find(params[:practica_id])
    @fortaleza = Fortaleza.find(params[:id]) if params[:id]
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