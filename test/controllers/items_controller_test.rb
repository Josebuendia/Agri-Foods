require 'test_helper'


class ItemsControllerTest < ActionDispatch::IntegrationTest
 # @image_image = fixture_path(Rails.root.join('test', 'fixtures', 'files', 'burger.jpg'),'image/jpg')
  setup do
  #  @image_image = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'burger.jpg'),'image/jpg')
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { category: 'Meat', county: 'Wicklow', description: 'Delicious beef', farm: 'Glen Vally Farm',
        # image_image: image_image, price: @item.price, shelf_life: @item.shelf_life, title: @item.title } }
          price: 20, shelf_life: '15 days', title: 'Beef' } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { category: @item.category, county: @item.county, description: @item.description, 
      farm: @item.farm, image: @item.image, price: @item.price, shelf_life: @item.shelf_life, title: @item.title } }
    #patch item_url(@item), params:  id @item.id  
    #assert_redirected_to item_url(@item)
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
      #new code
      #def delete_image_attachment
        # @image_image = ActiveStorage::Attachment.find(params[:id])
        # @image_image.purge
        # 
      
    end

    assert_redirected_to items_url
  end
end
