S3Plugin = require 'webpack-s3-plugin'

module.exports = ({webpackConfig}) ->
  webpackConfig.plugins.unshift new S3Plugin
    include: /.*/
    s3Options:
      accessKeyId: process.env.AWS_ACCESS_KEY_ID
      secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
      region: process.env.AWS_S3_REGION || 'us-west-1'
    s3UploadOptions:
      Bucket: process.env.AWS_S3_BUCKET
