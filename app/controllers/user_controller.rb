class UserController < ApplicationController
	def index
		@Users = User.all

		respond_to do |format|
    		format.html  
    		format.json  { render :json => @Users }
  		end
	end

	def show
		@User = User.find_by_user(params[:id])

		respond_to do |format|
    		format.html  
    		format.json  { render :json => @User }
  		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
 
		respond_to do |format|
			if @user.save
				format.html  { redirect_to(@user, :notice => 'Post was successfully created.') }
				format.json  { render :json => @user, :status => :created, :location => @post }
			else
				format.html  { render :action => "new" }
				format.json  { render :json => @user.errors, :status => :unprocessable_entity }
			end
		end
	end
end
