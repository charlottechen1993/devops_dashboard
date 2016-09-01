class Dashing.List extends Dashing.Widget
    ready: ->
        if @get('unordered')
            $(@node).find('ol').remove()
        else
            $(@node).find('ul').remove()

    onData: (data) ->
        # Handle incoming data
        # You can access the html node of this widget with `@node`
        $(@node).fadeOut().fadeIn()