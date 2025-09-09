controlsSetup();

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
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 13;
jspd[0] = -3.45;
jumpHoldFrames[1] = 9;
jspd[1] = -3.15;
onGround = true;

//sprites
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRun;
jumpSpr = sPlayerJump;

//moving platforms
myFloorPlat = noone;
moveplatXspd = 0;