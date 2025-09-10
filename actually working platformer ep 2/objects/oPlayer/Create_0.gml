controlsSetup()

//moving
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

//jumping
grav = .275;
termVel = 4;
onGround = true;
//succesive jump values
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 16;
jspd[0] = -3.15;
jumpHoldFrames[1] = 13;
jspd[1] = -2.85;