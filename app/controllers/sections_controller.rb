class SectionsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(content_type: 'text')
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = 'Section created successfully'
      redirect_to(action: 'index')
    else
      flash[:notice] = 'Failed to create section'
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section updated successfully'
      redirect_to(action: 'show', id: @section.id)
    else
      flash[:notice] = 'Failed to update section'
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = 'Section deleted successfully'
    redirect_to(action: 'index')
  end

  private

  def section_params
    params.require(:section).permit(
      :name, :position, :visible, :page_id, :content_type, :content
    )
  end
end
