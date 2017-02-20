=begin 
def full_title(page_tittle)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_tittle.empty?
    base_title
  else
    "#{base_title} | #{page_tittle}"
  end  
end
=end

include ApplicationHelper
