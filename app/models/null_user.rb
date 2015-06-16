class NullUser
  def username
    'Not logged in'
  end

  def authenticate(*)
    false
  end

  def activities
    Activity.none
  end

  def current_action
  end
end
