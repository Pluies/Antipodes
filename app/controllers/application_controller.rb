class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :guess_best_locale

  protected

  def guess_best_locale
    @requested_locale = http_accept_language.preferred_language_from(%w{en-US fr-FR})
    if @requested_locale
      I18n.locale = @requested_locale.split('-').first
    end
  end

end
