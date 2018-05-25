#= require vue/dist/vue
#= require cash
#= require lodash/lodash

new Vue
  el: '#vue-app'

  data:
    users: [
      { name: 'Michael', surname: 'Jordan', height: '6ft 5', weight: '206 lb' }
      { name: 'Patric', surname: 'Erwin', height: '6ft 5', weight: '206 lb' }
      { name: 'Charles', surname: 'Barkley', height: '6ft 5', weight: '206 lb' }
      { name: 'Larry', surname: 'Johnson', height: '6ft 5', weight: '206 lb' }
      { name: 'Muggsy', surname: 'Bogues', height: '6ft 5', weight: '206 lb' }
      { name: 'Shawn', surname: ' Bradley', height: '6ft 5', weight: '206 lb' }
    ]
    current_page: null
    current_user: {}
    group_list_shown: false

  computed:
    current_page_class: -> "when-#{@current_page}"

  created: ->
    _.assign(user, {image: user_images[i]}, order: i + 1) for user, i in @users
    @current_user = @users[0]
    @select_page('trips')

  methods:
    goto: (url) ->
      window.location.href = url

    page_is: (page) -> @current_page is page
    order_class_for: (user) -> "user-order-#{user.order}"
    image_url_for: (user) -> "url(#{user.image})"

    select_page: (page) ->
      unless @current_page is page
        @group_list_shown = false
        delay = 400 * (@users.length - 1) * 0.75 + 0.5 + 1000
        _.delay (=> @group_list_shown = page is 'trips'), delay
        @current_page = page

    onSelectUser: (user) ->
      [@current_user.order, user.order] = [user.order, @current_user.order]
      @current_user = user
