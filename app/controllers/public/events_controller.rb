class Public::EventsController < ApplicationController
	before_action :authenticate_user!


	def index
		@user = current_user
		@events = @user.events.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event.save!
		redirect_to mypage_path
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to mypage_path
	end

	def destroy
		@event.destroy
		redirect_to 'users/index'
	end

	private
	def event_params
		params.require(:event).permit(:title, :start, :end, :user_id, :place, :body)
	end
end
