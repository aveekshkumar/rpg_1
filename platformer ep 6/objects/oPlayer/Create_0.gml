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
	coyoteHangTimer = 0;
  }

}

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
termVel = 5;
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
coyoteHangFrames = 7;

//jump buffer
coyoteJumpTimer = 0;
coyoteJumpFrames = 10;