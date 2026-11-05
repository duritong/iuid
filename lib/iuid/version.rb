# frozen_string_literal: true

class Iuid
  module VERSION
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = nil

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')

    def self.version
      STRING
    end

    def self.to_s
      STRING
    end
  end
end
