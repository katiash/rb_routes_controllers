class UsersController < ApplicationController
    def index
        # Even though we are using the redirect_to method, 
        # the flash isn't an instance variable, so it will persist for one more HTTP request/response cycle.
        # You will often see people using flash like this:
        # if errors?
        #     flash[:error] = "You have errors"
        #     redirect_to '/users/' #pathing will be explained later
        # else
        #     flash[:success] = "You did it!"
        #     redirect_to '/users/'
        # end
        @users = User.all # If someone comes to our index page, we need to query the database for all
        # of our users, then display them in this (index) view.
        # RENDERS index.html.erb view in the views/users folder (by DEFAULT without specifying)
    # END of index method??
    end #RENDERS INDEX.html.erb TEMPLATE

    ######################### FLASH (CONTINUED...) ########################
    # ( You will often see people using flash like this:
    # redirect_to root_url, flash: { referral_code: 1234 }
    # redirect_to root_url, notice: "You have successfully logged out."
    # redirect_to root_url, alert: "You're stuck here!" )

    #########################  SESSION  #########################
    # When we want to remove a value, we need to set the appropriate session key to nil.
    # If you need to clear a whole session, you can use session.clear (or: reset_session).
    def create
        unless params[:id]
            User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
            #adds the value in params[:id] to the :id key in session
            session[:id] = params[:id] #we will talk about params in a bit
            redirect_to "/users" and return
        else
            user=User.find(params[:id])
            puts user.inspect
            user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
            puts user.inspect
            redirect_to "/users"
        end
    end

    def total
       render text: User.count and return
    end

    #NOT USING YET
    def log_out
        #sets the session[:id] to nil, overwriting the previous value
        session[:id] = nil 
        # OR
        # reset_session, OR session.clear - nullifies entire session!
        #BUT WHERE DOES THIS METHOD REDIRECT TO?? redirect_to application#index
    end

    # DON'T NEED THIS if CREATE user is on INDEX page)
    # def new # NEW
    #     # if signed_in?
    #     # this method checks if a user is signed in. 
    #     # If so, it will redirect to the profile method below, by using the "<controller>/<method>"
    #     # convention.
    #     #    redirect_to "/users/profile"
    #     # end
    #     # If the IF statement is not executed, - RENDER the NEW.html.erb (or INDEX.html.erb if 
    #     # CREATE form is on INDEX page) in the users view folder
    #     render new.html.erb
    # end    
    def new
        # When a http GET request to '/users/new' is received, have it render: a view file with an empty
        # form to create a new user.
    end
   
    # def profile
    #     # RENDERS the profile.html.erb view in the views/users folder
    # end

    def show
        # 3. When a http GET request to '/users/1' is received, have it show, in json format, user 1's information.
        render json: User.find(params[:id])
        # RENDERS show.html.erb template in the views/users folder
    end
    
    def edit
        # suggested way to write query to avoid injection:
        # @user= User.where ( "orders_count = ?", params[:orders] )
        @user = User.find(params[:id])
        puts @user.inspect
    end
    # def home
    #     # RENDERS home.html.erb view in the views/users folder
    #     render "home" 
    # end
    
    #NOT USING YET:
    def list_products
        # render the all.html.erb view in the views/products folder
        render "products/all"
    end
end

