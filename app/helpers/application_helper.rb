module ApplicationHelper
  
  def nvra_css(registrant = @registrant, locale = @locale)
    stylesheets = []
    locale ||= registrant ? registrant.locale : nil
    if !locale.nil?
      stylesheets << "nvra/locales/#{locale}" if Translation.has_nvra_css?(locale)
    end
    stylesheets
  end
  
end
 