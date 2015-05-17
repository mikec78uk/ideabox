class IdeasController < ApplicationController

	# To add a page to my site
	# add an index page (aka the homepage)

	def index
		
		if params[:tag]

			@ideas = Idea.tagged_with(params[:tag]).order("created_at desc")

		else

			@ideas = Idea.order("created_at desc")

		end


		

		###### SORT VIA PARAMS
		#if params[:sort] == 'recent'
			# == is compare whereas = is assignment
			# sort by most recent
			
			# could include where, for example Story.where(is_featured: true).order etc....
		#	@ideas = Idea.order("created_at desc")
			
			
		#elsif params[:filter] == 'featured'
		
		#	@ideas = Idea.where(is_featured: true).order("title asc")
			
		#else
			# sort by most voted
		#	@ideas = Idea.order("created_at desc")
		#end
		
		
	end

	# Show me an individual story page
	def show
		# I want to get one individual story
		# params :id is from URL, e.g. if /stories/7
		# then params :id is 7
		@idea = Idea.find(params[:id])
		 
	end


	# This is going to be the "Adding a new story form"
	def new
		@idea = Idea.new		
	end


	# new and create work as a pair
	# the create action actually adds things to the database

	def create
		#make @story be a blank story but with fields filled in
		@idea = Idea.new(idea_params)
	
		# Actually save to db IF validations pass
		# If they don't pass, show the form with errors
			if @idea.save
				# Let user know its successful
				flash[:success] = "Congratulations, your idea has been successfully added."
				# lets make it go back to the homepage
				redirect_to root_path
				
			else
				# if the story DOESN'T save do this
				# Show the new.html.erb form with errors
				# render shows the new page (retains the values and shows the error/s)
				render "new"
			end	
			
	end

	
	# I want to show the edit form for an individual story

	def edit
		# find the idea based on the URL
		@idea = Idea.find(params[:id])

	end

	# I want to update the database with the updated data
	def update
		# Find the story (same code as edit)
		@idea = Idea.find(params[:id])
		
			# Update the record with the form data IF it validates
			if @idea.update(idea_params)
				# Let user know its successful
				flash[:success] = "You've updated the idea"
				# Go to story page (show)
				#redirect_to idea_path(@idea)
				redirect_to root_path
			else
				# Same principle as def create (if it doesn't update, show edit form with errors)
				render "edit"
			end

	end

	# Lets destroy the idea
	def destroy
		# Find the idea 
		@idea = Idea.find(params[:id])
		# Destroy it
		@idea.destroy
		
		# Let user know its successful
		flash[:error] = "You've deleted the idea"

		# Go to Homepage
		redirect_to root_path

	end


	def idea_params
		params.require(:idea).permit(:title, :description, :problem, :tag_list)
	end


end
