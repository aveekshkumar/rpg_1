controlsSetup()

//custom functions for player
function setOnGround(_val = true)
{
  if _val == true
  {
	onGround = true;
	coyoteHangTimer = coyoteHangFrames
  } else {
	onGround = false;
	myFloorPlat = noone;
	coyoteHangTimer = 0;
  }

}

function checkForSemiSolidPlatform(_x,_y)
{
	//create a return variable
	var _rtrn = noone;
	
	//we must not be moving upwards
	if yspd >= 0 && place_meeting(_x, _y, oSemiSolidWall)
	{
		//create a ds list to store all coliding instance of semisoldwall
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x,_y, oSemiSolidWall, _list, false)
	
	    //loop through colliding instances
		for ( var i = 0; i < _listSize;  i++ )
		{
			var _listInst = _list[| i];
			if _listInst != forgetSemiSolid && floor(bbox_bottom) <= ceil( _listInst.bbox_top - _listInst.yspd )
			{
				 _rtrn = _listInst;
				 //exit the loop early
				 i = _listSize;
			}
		}
		
		//destroy the ds list to avoid a memory leak and to free memory
		ds_list_destroy(_list);
	}
	
	//return our variable
	return _rtrn;
}

depth = -30;

//sprite
maskSpr = sPlayerIdle
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRun;
jumpSpr = sPlayerJump;

//moving
face = 1;
moveDir = 0;
runType = 0;
moveSpd[0] = 2;
moveSpd[1] = 4;
xspd = 0;
yspd = 0;

//jumping
grav = .275;
termVel = random(5.5);
onGround = true;
//succesive jump values
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 18;
jspd[0] = -3.30;
jumpHoldFrames[1] = 15;
jspd[1] = -2.85;

//coyote time
//hang time
coyoteHangTimer = 0;
coyoteHangFrames = 6.5;

//jump buffer
coyoteJumpTimer = 0;
coyoteJumpFrames = 10;

//moving platforms
myFloorPlat = noone;
earlyMoveplatXspd = false;
downSlopeSemiSolid = noone;
forgetSemiSolid = noone;
moveplatXspd = 0;
moveplatMaxYspd = 8;
crushDeathTime = 5;
crushTimer = 0;