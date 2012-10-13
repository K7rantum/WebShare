class StaticPagesController < ApplicationController
  
  def services
    @title = "Our Services"
  end
  
  def about
    @title = "About WebShare"
  end

  def contact
    @title = "Contact Us"
  end
  
  def terms_and_conditions
    @title = "Terms & Conditions"
  end
  
  def privacy_policy
    @title = "Privacy Policy"
  end
  
  def terms_of_service
    @title = "Terms of Service"
  end
  
end
