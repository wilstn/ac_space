# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @TimerWidget
  constructor: ->
    @secCount = 0
    @minCount = 0

    @starter

    @start_button = $('#start')
    @stop_button = $('#pause')
    @reset_button = $('#reset')

    @sec = $('.sec')
    @min = $('.min')

    this.bind_start()   # rule number 2 : use this to tell js to look up at damn class before complaining
    this.bind_stop()
    this.bind_reset()
    this.addThis()

  addThis: =>
    @sec.text(@secCount)
    @secCount++

    if @secCount == 60
      @secCount = 0
      @minCount++
      @min.text(@minCount)

  is_paused = true # default boolean value to check if it's running

  bind_start: =>  # use fat arrows to pass in the scope of whole class always
    @start_button.on 'click', =>
      if is_paused == true
        is_paused = false
        @starter = setInterval(this.addThis, 1000)



  bind_stop: =>
    @stop_button.on 'click', =>
        if is_paused == false
          is_paused = true
          clearInterval(@starter)


  bind_reset: =>
    @reset_button.on 'click', =>
      clearInterval(@starter)
      @secCount = 0
      @minCount = 0
      @sec.text(@secCount)
      @min.text(@minCount)
      is_paused = true

$('document').ready ->
  t = new TimerWidget
