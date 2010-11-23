class ProgramasController < ApplicationController

  before_filter :find_programa, :only => [:show, :edit, :update, :destroy]
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@programas = Programa.all
    @programas = Programa.search(params[:search])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @programas }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @programa }
    end
  end

  def new
    @programa = Programa.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @programa }
    end
  end

  def edit
  end

  def create
    @programa = Programa.new(params[:programa])
    respond_to do |format|
      if @programa.save
        format.html { redirect_to(@programa, :notice => 'Programa creado satisfactoriamente') }
        format.xml  { render :xml => @programa, :status => :created, :location => @programa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @programa.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @programa.update_attributes(params[:programa])
        format.html { redirect_to(@programa, :notice => 'Programa actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @programa.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @programa.destroy
    respond_to do |format|
      format.html { redirect_to(programas_url) }
      format.xml  { head :ok }
    end
  end

  private
  def find_programa
   @programa = Programa.find(params[:id])
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
