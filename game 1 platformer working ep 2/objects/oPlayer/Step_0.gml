//get inputs
leftKey = keyboard_check( vk_left);
rightKey = keyboard_check( vk_right);

//x movement
//direction
moveDir = rightKey - leftKey;

//get xspd
xspd = moveDir * moveSpd;

//x collision
var _subpixel = .5;
