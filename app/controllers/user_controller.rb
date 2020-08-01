class UserController < ApplicationController
    def login
        session[:login] = 1
        session[:cart] = nil
        #Changed the line below to Seller Login sucessfull! from "Admin Login sucessfull!"
        flash[:notice] = "Seller Login sucessfull!"
        redirect_to :controller => :items
    end

    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have been successfully logged out!!"
        redirect_to :controller => :items
    end

        #iteration for farmers page
    def farmers
        @users = User.all
    end

    def search
        st = "%#{params[:q]}%"
        @users = User.where("email like ?", st)
    end

    def show
    end

    #def farmers
     #   @user = User.find(params[:id])
          # FIXME get the view working for the farmers page
    #end
end
