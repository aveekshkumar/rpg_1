//get inputs
getControls();
//x movement
//direction
moveDir = rightKey - leftKey;

//Get xspd
xspd = moveDir * moveSpd;

//x collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
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

//move
x += xspd

//y movement
//gravity
yspd += grav

//reset/prepare jumping variables
if onGround
{
	jumpCount = 0;
	jumpHoldTimer = 0;
} else {
	//if player in air
	if jumpCount == 0 { jumpCount = 1; };
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
if place_meeting( x , y + yspd, oWall )
{
	   //scoot up to wall precisely
	   var _pixelCheck = _subPixel * sign(yspd);
	   while !place_meeting( x , y + _pixelCheck, oWall )
	  {
		  y += _pixelCheck;
      }
	
	//bonk code
	if yspd < 0
	{
		jumpHoldTimer = 0;
	}
	
	//set yspd to zero to collide
	yspd = 0;
}

//set if im on the ground
if yspd >= 0 && place_meeting( x, y+1, oWall )
{
	onGround = true;
}else{
	onGround = false;
}

//move
y += yspd;