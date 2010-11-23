class AprendicesController < ApplicationController

  before_filter :ficha_and_aprendices
  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@aprendices = Aprendiz.all
   #@aprendices = @ficha.aprendices.find(:all)
    @aprendices =  @ficha.aprendices.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @aprendices }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @aprendiz }
    end
  end

  def new
    @aprendiz = Aprendiz.new
    @especiales = Especial.all
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @aprendiz }
    end
  end

  def edit
    @especiales = Especial.all
  end

  def create
    @aprendiz = Aprendiz.new(params[:aprendiz])
    @aprendiz.ficha_id = @ficha.id
    respond_to do |format|
      if @aprendiz.save
        flash[:notice] = 'aprendiz creado satisfactoriamente'
        format.html { redirect_to ficha_aprendices_path(@ficha) }
        format.xml  { render :xml => @aprendiz, :status => :created, :location => @aprendiz }
      else
        @especiales = Especial.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @aprendiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @aprendiz.update_attributes(params[:aprendiz])
        flash[:notice] = 'aprendiz actualizado satisfactoriamente'
        format.html { redirect_to ficha_aprendices_path(@ficha) }
        format.xml  { head :ok }
      else
        @especiales = Especial.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aprendiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @aprendiz.destroy
    respond_to do |format|
      format.html { redirect_to ficha_aprendices_path(@ficha) }
      format.xml  { head :ok }
    end
  end
  
  protected
   def ficha_and_aprendices
    @ficha = Ficha.find(params[:ficha_id])
    @aprendiz = Aprendiz.find(params[:id]) if params[:id]
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
