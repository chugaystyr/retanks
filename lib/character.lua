function NewCharacter()

  YWallSound = love.audio.newSource("assets/ywall.wav", "stream") 
  YWallSound:setVolume(0.4) 
  YWallSound:setPitch(1)
  
  ShotSound = love.audio.newSource("assets/shot.wav", "stream") 
  ShotSound:setVolume(0.5) 
  ShotSound:setPitch(1) 
        
  local character = {} 
  character.x = 100 
  character.y = 100
  character.tx = 100
  character.ty = 100
  character.r = math.rad(0)
  character.sx = 1
  character.sy = 1
  character.width = 32
  character.height = 32
  
  character.rturn = function(isrepeat)
    currpos = character.x + (character.width/2)
    gamew = love.graphics.getWidth()
    if currpos < gamew then
      character.x = character.x + 3
      character.tx = character.tx + 3
    else
      love.audio.play(YWallSound)
    end
    character.r = math.rad(90)
  end
  
  character.lturn = function(isrepeat)
    currpos = character.x - (character.width/2)
    if currpos > 0 then
      character.x = character.x - 3
      character.tx = character.tx - 3
    else
      love.audio.play(YWallSound)
    end
    character.r = math.rad(270)
  end
  
  character.uturn = function(isrepeat)
    currpos = character.y - (character.height/2)
    if currpos > 0 then
      character.y = character.y - 3
      character.ty = character.ty - 3
    else
      love.audio.play(YWallSound)
    end
    character.r = math.rad(0)
  end
  
  character.dturn = function(isrepeat)
    currpos = character.y + (character.height/2)
    gameh = love.graphics.getHeight()
    if currpos < gameh then
      character.y = character.y + 3
      character.ty = character.ty + 3
    else
      love.audio.play(YWallSound)
    end
    character.r = math.rad(180)
  end
  
  character.shot = function(isrepeat)
    love.audio.play(ShotSound)
  end
  
  return character
end