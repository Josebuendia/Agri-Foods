ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  #commented out the below line to deal with ActionView::Template::Error: Permission denied @ rb_file_s_rename testing
  #parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers 
  include Warden::Test::Helpers 
   def log_in( user ) 
     if integration _ test? 
   #use warden helper 
    login_as(user, :scope => :user)
     else #controller test, model test 18 
    #use devise helper 
    sign_(user) 
     end
   end  
end
