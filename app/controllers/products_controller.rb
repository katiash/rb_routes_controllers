# In console: 
# rails generate controller <ControllerName> <methods space separated>
# Controller name is capitalized and plural

# EXAMPLE:
# rails g controller Products index new ~produces:
class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: @products # Renders JSON formatted output to HTML file
  end

  # def new
  # end

  def create
    @product = Product.create( name: params[:name], description: params[:description])
    puts @product # PUT String to Console
    # render text: 'created a new product' # Renders TEXT output to HTML file
    redirect_to '/products/index'
  end

  # NOTES ON render TYPES: 
  # Whatever is printed in our controller, shows up in the console or HTML.
  # We can render the type of response (jSON, view file, or text). 
  # Using render text to debug your rails application can become extremely helpful, as you don't have to
  # check the console, but can immediately see the content of any variable in the browser window.
end
