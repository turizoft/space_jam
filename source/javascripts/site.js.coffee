#= require vue/dist/vue
#= require cash
#= require lodash/lodash

new Vue
  el: '#vue-app'

  data:
    current_page: 'home'
    pages: [
      'Behind the team'
      'Site Map'
      'Stellar Souvenirs'
      'Junior Jam'
      'The Lineup'
      'Jam Central'
      'Planet B-Ball'
      'Lunar Tunes'
      'Jump Station'
      'Warner Studio Store'
    ]

  computed:
    current_page_class: -> "when-#{@current_page}"

  created: ->

  methods:
    goto: (url) ->
      window.location.href = url

    page_is: (page) -> @current_page is page

    select_page: (page) ->
      unless @current_page is page
        @current_page = page
