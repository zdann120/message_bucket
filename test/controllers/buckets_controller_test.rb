require 'test_helper'

class BucketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bucket = buckets(:one)
  end

  test "should get index" do
    get buckets_url
    assert_response :success
  end

  test "should get new" do
    get new_bucket_url
    assert_response :success
  end

  test "should create bucket" do
    assert_difference('Bucket.count') do
      post buckets_url, params: { bucket: { access_code: @bucket.access_code, token: @bucket.token, user_id: @bucket.user_id } }
    end

    assert_redirected_to bucket_url(Bucket.last)
  end

  test "should show bucket" do
    get bucket_url(@bucket)
    assert_response :success
  end

  test "should get edit" do
    get edit_bucket_url(@bucket)
    assert_response :success
  end

  test "should update bucket" do
    patch bucket_url(@bucket), params: { bucket: { access_code: @bucket.access_code, token: @bucket.token, user_id: @bucket.user_id } }
    assert_redirected_to bucket_url(@bucket)
  end

  test "should destroy bucket" do
    assert_difference('Bucket.count', -1) do
      delete bucket_url(@bucket)
    end

    assert_redirected_to buckets_url
  end
end
