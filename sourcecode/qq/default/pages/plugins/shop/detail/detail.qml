<view qq:if="{{(data || null) != null}}">
  <!-- 头部 -->
  <import src="/pages/plugins/shop/public/header.qml" />
  <template is="shop-header" data="{{data_base: data_base, shop: shop, shop_navigation: shop_navigation, shop_goods_category: shop_goods_category, shop_favor_info: shop_favor_info, search_keywords_value: search_keywords_value, header_service_status: header_service_status, nav_category_status: nav_category_status}}"></template>

  <!-- 数据模式 -->
  <block qq:if="{{(shop.data_model || 0) == 1}}">
    <!-- 拖拽模式、引入拖拽数据模块 -->
    <component-layout prop-data="{{data}}"></component-layout>
  </block>
  <!-- 自动模式 -->
  <block qq:else>
    <view class="shop-category-list nav-roll oh bg-white margin-top-sm margin-bottom-sm">
      <scroll-view scroll-x>
        <view class="item {{(shop_category_tab_value == 0) ? 'active' : ''}}" bindtap="shop_category_tab_event" data-value="0">全部商品</view>
        <block qq:if="{{shop_goods_category.length > 0}}">
          <block qq:for="{{shop_goods_category}}" qq:key="key">
            <view class="item {{(shop_category_tab_value == item.id) ? 'active' : ''}}" bindtap="shop_category_tab_event" data-value="{{item.id}}">{{item.name}}</view>
          </block>
        </block>
      </scroll-view>
    </view>
    <view class="data-list oh">
      <block qq:if="{{goods_list.length > 0}}">
        <block qq:for="{{goods_list}}" qq:key="key">
          <view qq:if="{{item.active != 0}}" class="items bg-white">
            <navigator url="/pages/goods-detail/goods-detail?goods_id={{item.id}}" hover-class="none">
              <image src="{{item.images}}" mode="aspectFit" />
              <view class="base">
                <view class="multi-text">{{item.title}}</view>
                <view class="price">
                  <text class="sales-price">{{currency_symbol}}{{item.min_price}}</text>
                </view>
              </view>
            </navigator>
          </view>
        </block>
      </block>
      <block qq:else>
        <import src="/pages/common/nodata.qml" />
        <template is="nodata" data="{{status: 0}}"></template>
      </block>
    </view>
  </block>

  <!-- 结尾 -->
  <import src="/pages/common/bottom_line.qml" />
  <template is="bottom_line" data="{{status: data_bottom_line_status}}"></template>
</view>
<view qq:else>
  <import src="/pages/common/nodata.qml" />
  <template is="nodata" data="{{status: data_list_loding_status, msg: data_list_loding_msg}}"></template>
</view>