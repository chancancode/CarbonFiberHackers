class PlaygroundController < ApplicationController
	def index
		# This action shows you the listing you found in http://the.app/playground/

		# This produce a string like "/Projects/theapp/app/views/playground/*" or
		# "C:\theapp\app\views\playground\*" depending on your platform
		views_path = File.join( Rails.root, "app", "views", "playground", "*" )

		# This produce an Array of strings, something like
		# [
		# 	"/Projects/theapp/app/views/playground/1-html-test.html",
		# 	"/Projects/theapp/app/views/playground/2-erb-test.html",
		#   ...
		# ]
		views_files = Dir.glob( views_path )

		# Now sort them (`views_files.sort!` is roughly equal to `views_files = views_files.sort`)
		views_files.sort!

		# And then massage it into something like...
		# [
		# 	{ name: "1-html-test", path: "/Projects/theapp/app/views/playground/1-html-test.html" },
		# 	{ name: "2-erb-test", path: "/Projects/theapp/app/views/playground/2-erb-test.html" },
		#   ...
		# ]
		# 
		# (Again, `views_files.map! do ... end` is roughly equal to `views_files = views_files.map do ... end`)
		views_files.map! do |view_path|
			{
				name: view_path.split(/\/|\\/).last.split('.').first,
				path: view_path
			}
		end

		# Assigning it to a variable name starting with an '@' will make it available to the erb templates
		@views = views_files
	end

	def c_variables
		# Variables starting with an '@' will be made available to the erb templates
		@variable = "It worked!"

		# On the other hand, this is just a local variable and you won't have access to it in your erb templates
		variable = "This won't work..."

		@what_is_this = "Try to figure out this one".split.shuffle.join(' ').humanize
	end
end
