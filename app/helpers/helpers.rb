class Helpers

  def self.is_logged_in?(session)
    if session[:user_id] != nil
      true
    else
      false
    end
  end

end
