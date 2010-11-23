class CargosController < ApplicationController

  before_filter :require_user
  layout :determine_layout
  load_and_authorize_resource

  def index
    #@cargos = Cargo.all
    @cargos = Cargo.search(params[:search])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @cargos }
    end
  end

  def show
    @cargo = Cargo.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @cargo }
    end
  end

  def new
    @cargo = Cargo.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @cargo }
    end
  end

  def edit
    @cargo = Cargo.find(params[:id])
  end

  def create
    @cargo = Cargo.new(params[:cargo])

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to(@cargo, :notice => 'Cargo creado satisfactoriamente') }
        format.xml  { render :xml => @cargo, :status => :created, :location => @cargo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cargo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @cargo = Cargo.find(params[:id])

    respond_to do |format|
      if @cargo.update_attributes(params[:cargo])
        format.html { redirect_to(@cargo, :notice => 'Cargo actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cargo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cargo = Cargo.find(params[:id])
    @cargo.destroy

    respond_to do |format|
      format.html { redirect_to(cargos_url) }
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