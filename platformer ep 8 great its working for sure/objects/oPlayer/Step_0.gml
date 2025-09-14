//get inputs
getControls();

//get out of solid moveplats
var _rightWall = noone;
var _leftWall = noone;
var _bottomWall = noone;
var _topWall = noone;
var _list = ds_list_create();
var _listSize = instance_place_list( x, y, oMovePlatCircular, _list, false );

//loop through it
for( var i = 0; i < _listSize; i++ )
{
	var _listInst = _list[| i];
	
//find walls in every direction
	//right walls
	if _listInst.bbox_left - _listInst.xspd >= bbox_right-1
	{
		if !instance_exists(_rightWall)|| _listInst.bbox_left < _rightWall.bbox_left
		{
			_rightWall = _listInst;
		}
	}
	//left walls
	if _listInst.bbox_right - _listInst.xspd <= bbox_left+1
	{
		if !instance_exists(_leftWall)|| _listInst.bbox_right > _leftWall.bbox_right
		{
			_leftWall = _listInst;
		}
	}
	//bottom wall
	if _listInst.bbox_top - _listInst.yspd >= bbox_bottom-1
	{
		if !_bottomWall || _listInst.bbox_top < _bottomWall.bbox_top
		{
			_bottomWall = _listInst;
		}
	}
	//up wall
	if _listInst.bbox_bottom - _listInst.yspd <= bbox_top+1
	{
		if !_topWall || _listInst.bbox_bottom > _topWall.bbox_bottom
		{
			_topWall = _listInst;
		}
	}
}

//destroy the ds list to free memory
ds_list_destroy(_list);


//get out of walls
    //right wall
	if instance_exists(_rightWall)
	{
		var _rightDist = bbox_right - x;
		x = _rightWall.bbox_left - _rightDist;
	}
	
	//left wall
	if instance_exists(_leftWall)
	{
		var _leftDist = x - bbox_left;
		x = _leftWall.bbox_right + _leftDist;
	}
	if instance_exists(_bottomWall)
	{
		var _bottomDist = bbox_bottom - y;
		y = _bottomWall.bbox_top - _bottomDist;
	}
	//top wall (includes collision and crouch )
	if instance_exists(_topWall)
	{
		var _upDist = y - bbox_top;
		var _targetY = _topWall.bbox_bottom + _upDist;
		if !place_meeting( x, _targetY, oWall )
		{
			y = _targetY;
		}
	}
	
//dont getleft behind by my moveplat!!
earlyMoveplatXspd = false;
if instance_exists( myFloorPlat ) && myFloorPlat.xspd != 0 && !place_meeting( x, y + moveplatMaxYspd+1, oWall )
{
	//go kove into back there
	if !place_meeting( x + myFloorPlat.xspd, y, oWall)
	{
		x += myFloorPlat.xspd;
		earlyMoveplatXspd = true;
	}
}

//get out of solid moveplats
var _rightWall = noone;
var _leftWall = noone;
var _bottomWall = noone;
var _topWall = noone;
var _list = ds_list_create();
var _listSize = instance_place_list( x, y, oMovePlatHor, _list, false );

//loop through it
for( var i = 0; i < _listSize; i++ )
{
	var _listInst = _list[| i];
	
//find walls in every direction
	//right walls
	if _listInst.bbox_left - _listInst.xspd >= bbox_right-1
	{
		if !instance_exists(_rightWall)|| _listInst.bbox_left < _rightWall.bbox_left
		{
			_rightWall = _listInst;
		}
	}
	//left walls
	if _listInst.bbox_right - _listInst.xspd <= bbox_left+1
	{
		if !instance_exists(_leftWall)|| _listInst.bbox_right > _leftWall.bbox_right
		{
			_leftWall = _listInst;
		}
	}
	//bottom wall
	if _listInst.bbox_top - _listInst.yspd >= bbox_bottom-1
	{
		if !_bottomWall || _listInst.bbox_top < _bottomWall.bbox_top
		{
			_bottomWall = _listInst;
		}
	}
	//up wall
	if _listInst.bbox_bottom - _listInst.yspd <= bbox_top+1
	{
		if !_topWall || _listInst.bbox_bottom > _topWall.bbox_bottom
		{
			_topWall = _listInst;
		}
	}
}

//destroy the ds list to free memory
ds_list_destroy(_list);


//get out of walls
    //right wall
	if instance_exists(_rightWall)
	{
		var _rightDist = bbox_right - x;
		x = _rightWall.bbox_left - _rightDist;
	}
	
	//left wall
	if instance_exists(_leftWall)
	{
		var _leftDist = x - bbox_left;
		x = _leftWall.bbox_right + _leftDist;
	}
	if instance_exists(_bottomWall)
	{
		var _bottomDist = bbox_bottom - y;
		y = _bottomWall.bbox_top - _bottomDist;
	}
	//top wall (includes collision and crouch )
	if instance_exists(_topWall)
	{
		var _upDist = y - bbox_top;
		var _targetY = _topWall.bbox_bottom + _upDist;
		if !place_meeting( x, _targetY, oWall )
		{
			y = _targetY;
		}
	}
	
//dont getleft behind by my moveplat!!
earlyMoveplatXspd = false;
if instance_exists( myFloorPlat ) && myFloorPlat.xspd != 0 && !place_meeting( x, y + moveplatMaxYspd+1, oWall )
{
	//go kove into back there
	if !place_meeting( x + myFloorPlat.xspd, y, oWall)
	{
		x += myFloorPlat.xspd;
		earlyMoveplatXspd = true;
	}
}

//get out of solid moveplats
var _rightWall = noone;
var _leftWall = noone;
var _bottomWall = noone;
var _topWall = noone;
var _list = ds_list_create();
var _listSize = instance_place_list( x, y, oMovePlatVer, _list, false );

//loop through it
for( var i = 0; i < _listSize; i++ )
{
	var _listInst = _list[| i];
	
//find walls in every direction
	//right walls
	if _listInst.bbox_left - _listInst.xspd >= bbox_right-1
	{
		if !instance_exists(_rightWall)|| _listInst.bbox_left < _rightWall.bbox_left
		{
			_rightWall = _listInst;
		}
	}
	//left walls
	if _listInst.bbox_right - _listInst.xspd <= bbox_left+1
	{
		if !instance_exists(_leftWall)|| _listInst.bbox_right > _leftWall.bbox_right
		{
			_leftWall = _listInst;
		}
	}
	//bottom wall
	if _listInst.bbox_top - _listInst.yspd >= bbox_bottom-1
	{
		if !_bottomWall || _listInst.bbox_top < _bottomWall.bbox_top
		{
			_bottomWall = _listInst;
		}
	}
	//up wall
	if _listInst.bbox_bottom - _listInst.yspd <= bbox_top+1
	{
		if !_topWall || _listInst.bbox_bottom > _topWall.bbox_bottom
		{
			_topWall = _listInst;
		}
	}
}

//destroy the ds list to free memory
ds_list_destroy(_list);


//get out of walls
    //right wall
	if instance_exists(_rightWall)
	{
		var _rightDist = bbox_right - x;
		x = _rightWall.bbox_left - _rightDist;
	}
	
	//left wall
	if instance_exists(_leftWall)
	{
		var _leftDist = x - bbox_left;
		x = _leftWall.bbox_right + _leftDist;
	}
	if instance_exists(_bottomWall)
	{
		var _bottomDist = bbox_bottom - y;
		y = _bottomWall.bbox_top - _bottomDist;
	}
	//top wall (includes collision and crouch )
	if instance_exists(_topWall)
	{
		var _upDist = y - bbox_top;
		var _targetY = _topWall.bbox_bottom + _upDist;
		if !place_meeting( x, _targetY, oWall )
		{
			y = _targetY;
		}
	}
	
//dont getleft behind by my moveplat!!
earlyMoveplatXspd = false;
if instance_exists( myFloorPlat ) && myFloorPlat.xspd != 0 && !place_meeting( x, y + moveplatMaxYspd+1, oWall )
{
	//go kove into back there
	if !place_meeting( x + myFloorPlat.xspd, y, oWall)
	{
		x += myFloorPlat.xspd;
		earlyMoveplatXspd = true;
	}
}
	
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
downSlopeSemiSolid = noone;
if yspd >= 0 && !place_meeting( x + xspd, y + 1, oWall ) && place_meeting( x + xspd,y + abs(xspd)+1, oWall )
{
	//check for a semi solid in the way
	downSlopeSemiSolid = checkForSemiSolidPlatform( x + xspd, y + abs(xspd)+1 );
	//move down slope if there isnt a semisolid in the way
	if !instance_exists(downSlopeSemiSolid)
	{
		while !place_meeting( x + xspd, y + _subPixel, oWall ) { y += _subPixel; };
	}
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

//floor y collision

//check for semisolid and solid platforms under me
var _clampYspd = max( 0, yspd );
var _list = ds_list_create();//create ds list
var _array = array_create(0);
array_push( _array, oWall, oSemiSolidWall );

//do the actual check and add the objects to list
var _listSize = instance_place_list( x, y+1 + _clampYspd + termVel, _array, _list, false );

//loop through the coliding instances
for( var i = 0; i < _listSize; i++ )
{
	//get an instance wall from the list
	var _listInst = _list[| i];
	
	//avoid magnetism
	if _listInst != forgetSemiSolid
	&& ( _listInst.yspd <= yspd || instance_exists(myFloorPlat)  )
	&& (_listInst.yspd > 0 || place_meeting( x, y+1 + _clampYspd, _listInst) )
	{
	//return a wall that is below the player
	if _listInst.object_index == oWall
	|| object_is_ancestor( _listInst.object_index, oWall )
	|| floor(bbox_bottom) <= ceil( _listInst.bbox_top - _listInst.yspd )
	{
		//return the highest wall
		if !instance_exists(myFloorPlat)
		|| _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + _listInst.yspd
		|| _listInst.bbox_top + _listInst.yspd <= bbox_bottom
		{
			myFloorPlat = _listInst;
		}
	  }
	}
}

//destroy ds list to avoid memory leak
ds_list_destroy(_list);

//one last check to make sure the floor platform
if instance_exists(myFloorPlat) && !place_meeting( x, y + termVel, myFloorPlat )
{
	myFloorPlat = noone;
}

//land on the ground wall if there is one
if instance_exists(myFloorPlat)
{
	//scoot up to wall precisely
	var _subPixel = .5
	while !place_meeting( x, y + _subPixel, myFloorPlat ) && !place_meeting( x, y, oWall ) { y += _subPixel; }
    //make sure we dont end up below the top of a semisolid
	if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
	{
		while place_meeting( x, y, myFloorPlat ) {y -= _subPixel; };
	}
	//floor the y variable
	y = floor(y);
	
	//collide
	yspd = 0;
	setOnGround(true);
}

//manually fall from semisolid platform
if downKey
{
	//make sure we have a platform that is a semisolid
	if instance_exists(myFloorPlat)
	&& ( myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall) )
	{
		//check if we can go below the semisolid
		var _yCheck = y + max( 1, myFloorPlat.yspd+1 );
		if !place_meeting( x, _yCheck, oWall )
		{
			//move below the platform
			y += 1
			
			//forget this platform
			forgetSemiSolid = myFloorPlat;
			
			//no more platform
			setOnGround(false);
		}
	}
}

//move
if !place_meeting( x, y = yspd, oWall ) { y += yspd; };

//reset forgetSemiSolid
if instance_exists(forgetSemiSolid) && !place_meeting(x, y, forgetSemiSolid)
{
	forgetSemiSolid = noone;
}

//final moving platform collisions and movement
     //x movement
	 //get moveplat xspd
	 moveplatXspd = 0;
	 if instance_exists(myFloorPlat) { moveDir = myFloorPlat.xspd; };
	 
	 //move with moveplatXspd
	 if !earlyMoveplatXspd
	 {
		 
	 if place_meeting( x + moveplatXspd, y, oWall )
	 {
		 //scoot up to wall precisely
	     var _pixelCheck = _subPixel * sign(xspd);
	     while !place_meeting( x + _pixelCheck, y, oWall )
	     {
	          x += _pixelCheck;
         }
		 
		 //set moveplatXspd to 0 to finish collision
		 moveplatXspd = 0;
	 }
	 //move
	 x += moveplatXspd;
	 }

     //y - snap myself to myFloorPlat
	 if instance_exists(myFloorPlat)
	 && (myFloorPlat.yspd != 0 
	 || myFloorPlat.object_index == oSemiSolidWall
	 || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall) 
	 || myFloorPlat.object_index == oWall
	 || object_is_ancestor(myFloorPlat.object_index, oWall))
	 {
		 //snap to the top of the floor platform
		 if !place_meeting( x, myFloorPlat.bbox_top, oWall )
		 && myFloorPlat.bbox_top > bbox_bottom-termVel
		 {
			 y = myFloorPlat.bbox_top;
		 }
		 
		 /*//going on a solid wall when were on  a semisolidmoveplat
		 if myFloorPlat.yspd < 0 && place_meeting(x, y + myFloorPlat.yspd, oWall)
		 {
			 if myFloorPlat.object_index || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
			 {
				 //get pushed down
				 var _subPixel = .25;
				 while place_meeting( x, y + myFloorPlat.yspd, oWall ) { y += _subPixel; };
				 //if we got pushed into solid wall get pushed out
				 while place_meeting( x, y, oWall ) { y -= _subPixel; };
				 y = round(y);
			 }
			 
			 //cancel the myFloorPlat
			 setOnGround(false);
		 }//*/
	 }
	 
	 //get pushed down through a semisolid when collision with solid moving platform
	 if instance_exists( myFloorPlat )
	 && ( myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall) )
	 && place_meeting( x, y, oWall )
	 {
		//get out of the wall
		//were crushed if were still stuck afterwards
		
		//also dont check to far we shoudnt warp through walls
		var _maxPushDist = 8;
		var _pushDist = 0;
		var _startY = y;
		while place_meeting( x, y, oWall ) && _pushDist <= _maxPushDist
		{
			y++;
			_pushDist++;
		}
	    setOnGround(false);
		
		//if im set in a wall take back to startY
		if _pushDist > _maxPushDist { y = _startY; };
		}

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