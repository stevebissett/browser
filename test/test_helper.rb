# frozen_string_literal: true

require "simplecov"
SimpleCov.start

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)
require "bundler/setup"
require "minitest/autorun"
require "minitest/utils"
require "browser"
require "browser/testing"
require "yaml"

module Minitest
  class Test
    def assert_deprecated(message, file, line, &block)
      message = "#{message} (called from #{file}:#{line})"
      _out, err = capture_io(&block)
      assert_includes err, message
    end
  end
end
