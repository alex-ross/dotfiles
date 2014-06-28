require "rbconfig"

class OS
  class << self
    def to_s
      @to_s ||= RbConfig::CONFIG['host_os']
    end

    def osx?
      !!(to_s =~ /darwin/)
    end
  end
end
