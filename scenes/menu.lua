-- -----------------------------------------------------------------------------------
-- Import
-- -----------------------------------------------------------------------------------

local composer = require("composer")
local relayout = require("relayout")
local utilities = require("utilities")



-- -----------------------------------------------------------------------------------
-- Set variables
-- -----------------------------------------------------------------------------------

-- Layout
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scene
local scene = composer.newScene()

local function gotoGame()
  composer.removeScene( "scenes.game" )
  composer.removeScene( "scenes.gameover" )
    composer.gotoScene( "scenes.game" )
end
 
local function gotoGame2()
  composer.removeScene( "scenes.game2" )
    composer.gotoScene( "scenes.game2" )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

local sceneGroup = self.view

local background = display.newImageRect( sceneGroup, "backgroundMenu.png",_W, _H)
    background.x = _CX
    background.y = _CY
  --
 local title = display.newText(sceneGroup, "Corona Games", display.contentCenterX, 200, native.systemFont, 44 )
  local playButton = display.newText( sceneGroup, "Flappy Bird", display.contentCenterX, 400, native.systemFont, 44 )
    playButton:setFillColor( 0.82, 0.86, 1 )
 local ballonButton = display.newText( sceneGroup, "Ballon Game", display.contentCenterX, 300, native.systemFont, 44 )
    ballonButton:setFillColor( 0.75, 0.78, 1 )
  playButton:addEventListener("tap", gotoGame)
  ballonButton:addEventListener("tap", gotoGame2) 
end



-- show()
function scene:show( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end



-- hide()
function scene:hide( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end



-- destroy()
function scene:destroy(event)
  if event.phase == "will" then
  end
end



-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
