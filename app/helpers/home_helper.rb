module HomeHelper
    def fill_title title
		base_title = "Day la Blog cua Thong"
		title.nil? ? base_title : title + " | " + base_title
	end
end
