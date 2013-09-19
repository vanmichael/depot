require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do #Set @line_item equal to a specific fixture before excuting any of the tests.
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items) #there should be at least a line item from the line items fixture
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do #when a line item is created the count changes
      post :create, product_id: products(:ruby).id #look into products fixture and grab the ruby fixture id, and make sure it creates it(post)
    end

    assert_redirected_to store_path #redirects to the store path
  end

  test "should show line_item" do
    get :show, id: @line_item #Bring up the show view for that specific line item
    assert_response :success #make sure it responds
  end

  test "should get edit" do
    get :edit, id: @line_item #Bring up the edit view for that specific line item.
    assert_response :success
  end

  test "should update line_item" do
    put :update, id: @line_item, line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } #update view with the right attributes given in the line item fixture
    assert_redirected_to line_item_path(assigns(:line_item)) #Make sure it redirects to the line item path of that specific line item
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do #Make sure that the count decreases when a line item is deleted
      delete :destroy, id: @line_item #This actually deletes the line item with that specific id
    end

    assert_redirected_to line_items_path #Then make sure it redirects back to the index of line items
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do #See if line item count increments or changes
      xhr :post, :create, product_id: products(:ruby).id #Post with XML
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
end