require "test_helper"

class ConlangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conlang = conlangs(:one)
  end

  test "should get index" do
    get conlangs_url
    assert_response :success
  end

  test "should get new" do
    get new_conlang_url
    assert_response :success
  end

  test "should create conlang" do
    assert_difference("Conlang.count") do
      post conlangs_url, params: { conlang: {  } }
    end

    assert_redirected_to conlang_url(Conlang.last)
  end

  test "should show conlang" do
    get conlang_url(@conlang)
    assert_response :success
  end

  test "should get edit" do
    get edit_conlang_url(@conlang)
    assert_response :success
  end

  test "should update conlang" do
    patch conlang_url(@conlang), params: { conlang: {  } }
    assert_redirected_to conlang_url(@conlang)
  end

  test "should destroy conlang" do
    assert_difference("Conlang.count", -1) do
      delete conlang_url(@conlang)
    end

    assert_redirected_to conlangs_url
  end
end
