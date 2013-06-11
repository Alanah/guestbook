class TidyFormBuilder < ActionView::Helpers::FormBuilder
# our country_select calls the default select helper with the
# choices already filled in
	def country_select(method, options={}, html_options={})
		select(method, [['Canada', 'Canada'],
						['Mexico', 'Mexico'],
						['United Kingdom', 'UK'],
						['United States of America', 'USA']],
					options, html_options)
	end



	 def text_field(method, options={})
     # Helpers just return text to be included in the output
     # Here we create our label, and add it onto the front
     # of the superclass (ie. the default helper) output
     label = label_for(method, options) + super(method, options)
   end

   def text_area(method, options={})
     label_for(method, options) + super(method, options)
   end
 
   def password_field(method, options={})
     label_for(method, options) + super(method, options)
   end
   
   def file_field(method, options={})
     label_for(method, options) + super(method, options)
   end
 
   # Other helpers are slightly more complex
   
   def date_select(method, options = {}, html_options = {})
    label_for(method, options) + super(method, options, html_options)
   end
   
   def datetime_select(method, options = {}, html_options = {})
    label_for(method, options) + super(method, options, html_options)
   end
   
   def select(method, choices, options = {}, html_options = {})
     label_for(method, options) + super(method, choices, options, html_options)
   end
 
   def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
     label_for(method, options) + super(method, options, checked_value, unchecked_value)
   end
   
   private
   
   def label_for(method, options={})
     (label( options.delete(:label)|| method).safe_concat("<br />"))
  end

end