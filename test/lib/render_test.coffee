require '../test_helper'
assert = require 'assert'
should = require 'should'

render = require '../../lib/render'

html =  """
<!doctype html>
<html xmlns:ng="http://angularjs.org">
  <body>
    Hello {{ 1 + 2 }}!
  </body>
</html>
  """

html2 =  """
<!doctype html>
<html xmlns:ng="http://angularjs.org">
  <body ng-controller="Test">
    Hello {{ boundValue }}!
  </body>
</html>
  """

code = """
  function Test($scope){
    $scope.boundValue = 'Bound World'
  }
  """

describe "Rendering", ->
  it "renders a simple template", (done)->
    render html , "" , (errors,window)->
      should.not.exist(null)
      window.document.body.innerHTML.should.match(/Hello 3/)
      done()

  it "renders a controller template", (done)->
    render html2 , code , (errors,window)->
      should.not.exist(null)
      window.document.body.innerHTML.should.match(/Hello Bound World/)
      done()


