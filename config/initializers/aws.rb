require 'aws-sdk'
Aws.config[:region] = 'ap-northeast-1'
S3_BUCKET = Aws::S3::Resource.new.bucket('makera-portal')
