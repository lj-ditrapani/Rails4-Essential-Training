class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(name: 'default')
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = 'Page created successfully'
      redirect_to(action: 'index')
    else
      flash[:notice] = 'Failed to create page'
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page updated successfully'
      redirect_to(action: 'show', id: @page.id)
    else
      flash[:notice] = 'Failed to update page'
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = 'Page deleted successfully'
    redirect_to(action: 'index')
  end

  private

  def page_params
    params.require(:page).permit(
      :name, :position, :visible, :subject_id, :permalink
    )
  end
end
