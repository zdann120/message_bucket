class Webhooks::BucketsController < ApplicationController
  protect_from_forgery :except => [:receive]
  before_action :set_bucket

  def receive
    @message = @bucket.messages.new(message_params)
    @message.save!
    render json: { status: 'Success!' }, status: 201
  end

  private

  def set_bucket
    @bucket = Bucket.find_by_access_code(params[:access_code])
    render json: { error: 'URL does not belong to a valid bucket' } unless @bucket
  end

  def message_params
    json = request.body.read()
    json = JSON.parse(json)
    { message: json['message'], priority: json['priority'] }
  end
end
