class ApplicationController < ActionController::Base
  before_action :set_navbar_content

  def set_navbar_content
    @navbar_content = {
      'title' => 'MY APP',
      'action_name' => 'Home',
      'form_id' => 'form'
    }
  end
end
