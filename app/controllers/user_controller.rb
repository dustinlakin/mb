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
		@Memberships = @User.memberships.includes(:group)
		@Bets = @User.bets.includes({:moneyLine => [:team, :event]})

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

	def find_groups_by_event
		@user = User.find(params[:user])
		event = Event.find(params[:event])

		groups = @user.find_bettable_groups(event)

		render :json => groups, :callback => params[:callback]
	end
end
