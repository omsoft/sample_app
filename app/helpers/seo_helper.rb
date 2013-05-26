module SeoHelper
  
  def meta_title(base_title, page_title)
    full_title = base_title
    unless page_title.blank?
      full_title += " | #{page_title}"
    end
    
    full_title
  end
  
end
