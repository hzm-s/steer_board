module TailwindHelper
  def tw_size(origin)
    "#{origin}".sub(/\.0\z/, '')
  end
end
