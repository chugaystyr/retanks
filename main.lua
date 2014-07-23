require("lib/character")

function love.load()
    local myfont = love.graphics.newFont(45)
    love.graphics.setFont(myfont)
    love.graphics.setBackgroundColor(255,153,0)
    love.keyboard.setKeyRepeat(true)
    
    character = NewCharacter()
    
    BgSound = love.audio.newSource("assets/ss8b.mp3", "stream") 
    BgSound:setVolume(0.3) 
    BgSound:setPitch(1) 
    BgSound:setLooping(true)
    love.audio.play(BgSound)
    
    tankbase = love.graphics.newImage "assets/tankBase.png" 
    tankturret = love.graphics.newImage "assets/tankTurret.png" 
    
    bgon = true
end

function love.update(dt)
    if love.keyboard.isDown('g') then 
         love.graphics.print('GAME OVER!', 200, 200)
    end
end

function love.keypressed(key, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
   if key == " " then
      character.shot(isrepeat)
   end
   if key == "d" then
      character.rturn(isrepeat)
   end
   if key == "a" then
      character.lturn(isrepeat)
   end
   if key == "w" then
      character.uturn(isrepeat)
   end
   if key == "s" then
      character.dturn(isrepeat)
   end
   if key == "lctrl" then
      if bgon == true then
          love.audio.pause(BgSound)
          bgon = false
      else
          love.audio.play(BgSound)
          bgon = true
      end
   end
    
end

function love.draw()
      love.graphics.draw(tankbase, character.x, character.y, character.r, character.sx, character.sy, character.width/2, character.height/2)
      love.graphics.draw(tankturret, character.tx, character.ty, character.r, character.sx, character.sy, character.width/2, character.height/2)
end