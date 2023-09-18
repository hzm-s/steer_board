module UiHelper
  AVATAR_SIZES = {
    sm: 1.25,
    md: 2,
  }

  def avatar_size(size)
    AVATAR_SIZES[size]
  end
end
