module HomeHelper
    def fill_title title
		base_title = "Book Review System"
		title.nil? ? base_title : title + " | " + base_title
	end
end
