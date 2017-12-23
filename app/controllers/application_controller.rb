class ApplicationController < ActionController::Base

  # @@count =0
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render html: '<strong> What do you want me to say?? </strong>'.html_safe
  end

  def hello
    render text: 'Hello' # Renders TEXT output to HTML file
  end

  def say_hello
    render text: 'Saying Hello!' # Renders TEXT output to HTML file
  end

  def you_say
    unless params[:your_name]
      render text: 'Say Hello, whoever you are!'
    else
      if params[:your_name] == "Michael"
        redirect 'say/hello/joe'
      else
        render text: "Say Hello #{params[:your_name].capitalize}"
      end
    end
  end

  def times
    # @@count+=1
    if session[:count]!=nil
      session[:count] +=1
      render text: "You have visited here #{session[:count]} times" and return
    else
      session[:count] =0
      render text: "You have visited here #{session[:count]} times" and return
    end
  end

  def restart
    # session[:id] = nil 
    # OR
    # reset_session 
    # OR session.clear nullifies entire session!
    session[:count] = nil 
    redirect_to '/times' and return
  end
end
