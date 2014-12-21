ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

class ActiveSupport::TestCase
  def gen_attributes(object, rejects = ["id"])
    object.attributes.reject do |key, value|
      rejects.include?(key)
    end
  end
end
