# config/initializers/carrierwave.rb

# NullStorage provider for CarrierWave for use in tests.  Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
class NullStorage
  attr_reader :uploader

  def initialize(uploader)
    @uploader = uploader
  end

  def identifier
    uploader.filename
  end

  def store!(_file)
    true
  end

  def retrieve!(_identifier)
    true
  end
end


CarrierWave.configure do |config|
   if Rails.env.test?
    config.storage NullStorage
    # Required to prevent FactoryGirl from giving an infuriating exception
    # ArgumentError: wrong exec option
    # It also speeds up tests so it's a good idea
    config.enable_processing = false
  else
    config.storage = :aws
    config.aws_bucket = ENV["AWS_BUCKET"]     
    config.aws_acl = "public-read"

    config.aws_credentials = {
    access_key_id:     ENV["AWS_ACCESS_KEY"],                        
    secret_access_key: ENV["AWS_SECRET_KEY"], 
    region:            ENV["AWS_REGION"]           
  }
  end
end