class TweetsController < ApplicationController
	include ActionView::Helpers::DateHelper
	def index
	  @tweet = time_ago_in_words(Date.today - 1)
	end
	
	before_action :set_tweet, only: [:show, :edit, :update, :destroy]

	def index
		@tweets = Tweet.all
	end	

	def show
		@current_Time = Time.now
	end	

	def new
		@tweet = Tweet.new
	end	

	def edit
	end	

	def create
		@tweet = Tweet.new(tweet_params)	

		if @tweet.save
			redirect_to tweets_path
		else
			render :new
		end
	end	

	def update
		if @tweet.update_attributes(tweet_params)
			redirect_to tweets_path
		else
			render :edit
		end
	end	

	def destroy
		@tweet.destroy
		redirect_to tweets_path
	end	

	private
	def set_tweet
		@tweet = Tweet.find(params[:id])
	end	
	
	def tweet_params
		params.require(:tweet).permit(:handle, :content)
	end

end