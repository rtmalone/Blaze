CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  #elsif Rails.env.development?
  #  config.storage = :file
  #  config.enable_processing = true
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_KEY'],                        # required
      :aws_secret_access_key  => ENV['AWS_SECRET'],                        # required
      :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      :endpoint               => 'https://s3-us-west-2.amazonaws.com' # optional, defaults to nil
    }
    config.fog_directory  = 'tmalone-blazetraillog'                     # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
