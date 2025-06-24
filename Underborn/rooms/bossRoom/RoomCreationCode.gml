if (instance_exists(oPlayer)) {
    // You can safely access and reset the alarms directly
    oPlayer.alarm[0] = oPlayer.swordTime;
    oPlayer.alarm[1] = oPlayer.twinbladeTime;
    oPlayer.alarm[2] = oPlayer.javelinTime;
    oPlayer.alarm[3] = oPlayer.arrowTime;
    oPlayer.alarm[4] = oPlayer.iceShardTime;
    oPlayer.alarm[5] = oPlayer.fireballTime;
}