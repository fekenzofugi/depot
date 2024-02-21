require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    # assert_select looks for an html element named a that's contained in a nav element. This test verifies that a minumun of four such elements is present.
    assert_select 'nav a', minumim: 4

    assert_select 'main ul li', 3
    assert_select 'h2', 'Programming Ruby 1.9'
    assert_select 'div',  /\$[,\d]+\.\d\d/
  end
end
