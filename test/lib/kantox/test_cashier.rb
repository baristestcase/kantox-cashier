# frozen_string_literal: true

require "test_helper"

module Kantox
  class TestCashier < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Kantox::Cashier::VERSION
    end
  end
end
