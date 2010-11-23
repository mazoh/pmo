class EspecialesController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
   #@especiales = Especial.all
    @especiales = Especial.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @especiales }
    end
  end

  def show
    @especial = Especial.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @especial }
    end
  end

  def new
    @especial = Especial.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @especial }
    end
  end

  def edit
    @especial = Especial.find(params[:id])
  end

  def create
    @especial = Especial.new(params[:especial])
    respond_to do |format|
      if @especial.save
        format.html { redirect_to(@especial, :notice => 'Especial creado satisfactoriamente') }
        format.xml  { render :xml => @especial, :status => :created, :location => @especial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @especial.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @especial = Especial.find(params[:id])
    respond_to do |format|
      if @especial.update_attributes(params[:especial])
        format.html { redirect_to(@especial, :notice => 'Especial actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @especial.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @especial = Especial.find(params[:id])
    @especial.destroy
    respond_to do |format|
      format.html { redirect_to(especiales_url) }
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
