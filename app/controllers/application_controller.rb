class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!
  before_action :search_global

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: t("unauthorize")
  end

  def search_global
    @search = Demand.search(params[:q])
  end

  def search
   index
   render :index
 end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
