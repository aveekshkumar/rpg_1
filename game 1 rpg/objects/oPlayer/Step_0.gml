getControls()

//x movement
//direction
moveDir = rightKey - leftKey;

//get my face
if moveDir != 0 { face = moveDir; };

//Get xspd
runType = runKey
xspd = moveDir * moveSpd[runType];

//x collision
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall )
{
	//first check if there is a slope to go up
	if !place_meeting( x + xspd, y - abs(xspd) - 1, oWall )
	{
		while place_meeting( x + xspd, y, oWall ){ y -= _subPixel; };
	}
	else
    {
		//celling slopes
		if !place_meeting( x + xspd, y + abs(xspd)+1, oWall)
		{
			while !place_meeting( x + xspd, y, oWall) { y += _subPixel; };
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
	while !place_meeting( x + xspd, y + _subPixel, oWall) { y += _subPixel; };
}

//move
x += xspd

//y movement
//gravity
yspd += grav;

//cap falling speed
if yspd > termVel { yspd = termVel; };

//reset/prepare jumping variables
if onGround
{
	jumpCount = 0;
	jumpHoldTimer = 0;
} else {
	//if player in air
    if jumpCount == 0 { jumpCount = 1; };
}

//initiate jump
if jumpKeyBuffered && jumpCount < jumpMax
{
	//reset the buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//increase the number of performed jumps
	jumpCount ++;
	
	//set the jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
}
//cut off the jump by releasingthe jump button
if !jumpKey
{
	jumpHoldTimer = 0;
}

//jump based on timer/holding the button
if jumpHoldTimer > 0
{
	//constantly set yspd to be jspd
	yspd = jspd[jumpCount-1];
	//count down the timer
	jumpHoldTimer--;
}

//y collision
var _subPixel = .5;
if place_meeting( x, y + yspd, oWall )
{
	//scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting( x , y + _pixelCheck, oWall )
	{
		y += _pixelCheck;
	}
	
	//bonk code
	if yspd < 0 { jumpHoldTimer = 0;}
	
	//set yspd to zero to collide
	yspd = 0;
}

//floor y collision

//check for solid and semisolid platforms under me
var _clampYspd = max( 0, yspd );

//move
y += yspd;

//sprite control
//walking
if abs(xspd) > 0 { sprite_index = walkSpr; };
//running
if abs(xspd) >= moveSpd[1]{ sprite_index = runSpr; };
//not moving
if xspd == 0 { sprite_index = idleSpr; };
//in the air
if !onGround { sprite_index = jumpSpr; };

//set the collion mask
mask_index = idleSpr;