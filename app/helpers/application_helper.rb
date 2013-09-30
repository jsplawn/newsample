module ApplicationHelper

	def logo
	  image_tag("Beergologo.jpg", :alt => "BeerGo Rules!", :class => "round") 
	end
	
	def rail1
	   image_tag("rails.png", :alt => "Sample App", :class => "round") 
	end
	
	
	# Return a title on a per-page basis.
	def title
	  base_title = "Most epic website of all time, also celebrating beer."
	  if @title.nil?
	    base_title
	  else
	    "#{base_title} | #{@title}"
	  end
        end
end
