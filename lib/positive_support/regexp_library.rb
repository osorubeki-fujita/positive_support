module PositiveSupport::RegexpLibrary

  class << self

    def string_of_hour_and_min
      /\A( ?\d|\d{1,2})\:(\d{2})\Z/
    end

  end

end