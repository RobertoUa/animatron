'use strict'

angular.module 'animatronApp'
.directive 'editable', ($timeout) ->
  restrict: 'E'
  templateUrl: 'components/directives/editable/editable.html'
  scope:
    key: '=?'
    value: '=?'
    handleSave: '&onSave'
    handleCancel: '&onCancel'
  link: (scope, elm, attr) ->
    previousValue = undefined

    scope.edit = ->
      scope.editMode = true
      previousValue = scope.value
      $timeout (->
        elm.find('input')[0].focus()
        return
      ), 0, false
      return

    scope.save = ->
      scope.editMode = false
      scope.handleSave value: scope.value
      return

    scope.cancel = ->
      scope.editMode = false
      scope.value = previousValue
      scope.handleCancel value: scope.value
      return

    return
