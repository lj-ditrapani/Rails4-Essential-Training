class DemoController < ApplicationController
  def index
    # defaults to /demo/index.html
    # but can use render to give custom template view
    # render(template: 'demo/hello')
    # If no has, then :template is assumed
    # render 'demo/hello'
    # If no directory, then controller name is assumed
    # render 'hello'
  end

  def hello
    # render 'index'
    @array = [1, 2, 3, 4, 5]
    @id = params['id']  # could use :id as well
    @page = params[:page]
  end

  def other_hello
    # redirect_to(controller: 'demo', action: 'index')
    # Defaults to current controller
    redirect_to(action: 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

  def text_helpers
  end

  def escape_output
  end
end
