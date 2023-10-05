-- Import
local composer = require("composer")
local relayout = require("relayout")
local utilities = require("utilities")

-- Set variables
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scene
local scene = composer.newScene()

-- Start physics engine
local physics = require("physics")
physics.start()

-- create()
function scene:create(event)
  print("scene:create - game2")
  local sceneGroup = self.view

  local bg = display.newImageRect(sceneGroup,"backgroundGame2.png", _W, _H)
  bg.x = _CX
  bg.y = _CY

  -- Add platform with physics
  local platform = display.newImageRect(sceneGroup, "platform.png", _W, 50 )
  platform.x = _CX
  platform.y = _CY+375
  physics.addBody(platform, "static")

  -- Add balloon with physics
  local balloon = display.newImageRect(sceneGroup, "balloon.png", 200, 200 )
  balloon.x = _CX
  balloon.y = _CY
  balloon.alpha = 0.8
  physics.addBody( balloon, "dynamic", { radius=50, bounce=1 } )

  -- make the balloon go up, everytime someone click
  local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.65, bg.x, bg.y )
  end
  balloon:addEventListener( "tap", pushBalloon )
  

  local menu = display.newText(sceneGroup, "Volver al Menu", _W, 50, native.systemFont, 30 )
  menu.x = _CX
  menu.y = _CY+375
  menu:addEventListener("tap", function() 
     composer.gotoScene("scenes.menu")
  end)
end

-- show()
function scene:show(event)
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end

-- hide()
function scene:hide(event)
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end

-- destroy()
function scene:destroy(event)
  if event.phase == "will" then
    Runtime:removeEventListener("enterFrame", update)
    Runtime:removeEventListener("tap", pushBalloon)
  end
end

-- Scene event function listeners
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
