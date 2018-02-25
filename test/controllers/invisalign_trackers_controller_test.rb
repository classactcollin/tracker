require 'test_helper'

class InvisalignTrackersControllerTest < ActionController::TestCase
  setup do
    @invisalign_tracker = invisalign_trackers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invisalign_trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invisalign_tracker" do
    assert_difference('InvisalignTracker.count') do
      post :create, invisalign_tracker: { daynumber: @invisalign_tracker.daynumber, duration: @invisalign_tracker.duration, in: @invisalign_tracker.in, out: @invisalign_tracker.out, tracker_id: @invisalign_tracker.tracker_id }
    end

    assert_redirected_to invisalign_tracker_path(assigns(:invisalign_tracker))
  end

  test "should show invisalign_tracker" do
    get :show, id: @invisalign_tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invisalign_tracker
    assert_response :success
  end

  test "should update invisalign_tracker" do
    patch :update, id: @invisalign_tracker, invisalign_tracker: { daynumber: @invisalign_tracker.daynumber, duration: @invisalign_tracker.duration, in: @invisalign_tracker.in, out: @invisalign_tracker.out, tracker_id: @invisalign_tracker.tracker_id }
    assert_redirected_to invisalign_tracker_path(assigns(:invisalign_tracker))
  end

  test "should destroy invisalign_tracker" do
    assert_difference('InvisalignTracker.count', -1) do
      delete :destroy, id: @invisalign_tracker
    end

    assert_redirected_to invisalign_trackers_path
  end
end
