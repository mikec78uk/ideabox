class Idea < ActiveRecord::Base
	has_many :votes

	acts_as_taggable

	# Validates the presence of name an duration in the form.
	validates :title, presence: true
	validates :description, presence: true


end
