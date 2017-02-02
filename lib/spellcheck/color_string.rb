module SpellCheck
  class ColorString
    RED = 31
    GREEN = 32
    LIGHT_BLUE = 36

    class << self
      def red(str)
        colorize(str, RED)
      end

      def green(str)
        colorize(str, GREEN)
      end

      def light_blue(str)
        colorize(str, LIGHT_BLUE)
      end

      private

      def colorize(str, color_code)
        "\e[#{color_code}m#{str}\e[0m"
      end
    end
  end
end
