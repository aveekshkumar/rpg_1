//get inputs
getControls();
//x movement
//direction
moveDir = rightKey - leftKey;

//get my face
if moveDir != 0 { face = moveDir; };

//Get xspd
runType = runKey;
xspd = moveDir * moveSpd[runType];

//x collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
{
	//first check if there is a slope to go up
	if !place_meeting( x + xspd, y - abs(xspd)-1, oWall )
	{
		while place_meeting( x + xspd, y, oWall ) { y -= _subPixel; };
	} 
	//next check for ceiling slopes otherwise regular collision
	else  
	{
	//ceiling slopes
	if !place_meeting( x + xspd,y + abs(xspd*2)+1, oWall )
	{
		while place_meeting( x + xspd, y, oWall ) { y += _subPixel; };
	}
	else
	{
	
	//scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(xspd);
	while !place_meeting( x + _pixelCheck, y, oWall )
	{
	      x += _pixelCheck;
    }
	
	//set xspd to zero to collide
	xspd = 0;
    }
	}
}

//go down slopes
if yspd >= 0 && !place_meeting( x + xspd, y + 1, oWall ) && place_meeting( x + xspd, y + abs(xspd)+1, oWall )
{
	while !place_meeting( x + xspd, y + _subPixel, oWall ) { y += _subPixel; };
}

//move
x += xspd

//y movement
//gravity
if coyoteHangTimer > 0
{
	//count timer down
	coyoteHangTimer--;
}else{
	//apply gravity to player
	yspd += grav
	//we have realised we are not on the ground
	setOnGround(false);
}

//reset/prepare jumping variables
if onGround
{
	jumpCount = 0;
	jumpHoldTimer = 0;
	coyoteJumpTimer = coyoteJumpFrames;
} else {
	//if player in air
	coyoteJumpTimer--;
	if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1; };
}

//cap falling speed
if yspd > termVel { yspd = termVel; };

//initiate jump
if jumpKeyBuffered && jumpCount < jumpMax
{
	//reset the buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//increase number of performed jumps
	jumpCount++;
	
	//set the jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	//were no longer on ground
	setOnGround(false);
}

//cut off the jump
if !jumpKey
{
	jumpHoldTimer = 0;
}

//jump based on timer
if jumpHoldTimer > 0
{
	yspd = jspd[jumpCount-1];
	jumpHoldTimer--;
}

//y collision
var _subPixel = .5;

//upwards y collision
if yspd < 0 && place_meeting( x, y + yspd, oWall )
{
	//jump into sloped ceilings
	var _slopeSlide = false;
	//slide up left
	if moveDir == 0 && !place_meeting( x - abs(yspd)-1, y + yspd, oWall )
	{
		while place_meeting( x, y + yspd, oWall ) { x -= 1; };
		_slopeSlide = true;
	}
	
	//slide up right
	if moveDir == 0 && !place_meeting( x + abs(yspd)+1, y + yspd, oWall )
	{
		while place_meeting( x, y + yspd, oWall ) { x += 1; };
		_slopeSlide = true;
	}
	
	//normal y collision
	if !_slopeSlide
	{
		if place_meeting( x , y + yspd, oWall )
{
	   //scoot up to wall precisely
	   var _pixelCheck = _subPixel * sign(yspd);
	   while !place_meeting( x , y + _pixelCheck, oWall )
	  {
		  y += _pixelCheck;
	  }
	  
	//set yspd to zero to collide
	yspd = 0;
}
	}
}

//downwards y collision
if yspd >= 0
{
if place_meeting( x , y + yspd, oWall )
{
	   //scoot up to wall precisely
	   var _pixelCheck = _subPixel * sign(yspd);
	   while !place_meeting( x , y + _pixelCheck, oWall )
	  {
		  y += _pixelCheck;
      }
	
	//bonk code(optional
	/*if yspd < 0
	{
		jumpHoldTimer = 0;
	}*/
	
	//set yspd to zero to collide
	yspd = 0;
}
}

//set if im on the ground
if yspd >= 0 && place_meeting( x, y+1, oWall )
{
	setOnGround(true);
}

//move
y += yspd;


//sprite control
//walking
if abs(xspd) > 0 { sprite_index = walkSpr; };
//running
if abs(xspd) >= moveSpd[1] { sprite_index = runSpr; };
//not moving
if xspd == 0 { sprite_index = idleSpr; };
//in the air
if !onGround { sprite_index = jumpSpr; };
    //set the collision mask
	mask_index = maskSpr;