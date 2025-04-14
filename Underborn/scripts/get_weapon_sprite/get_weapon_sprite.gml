/// get_weapon_sprite(name)
function get_weapon_sprite(name) {
    switch (name) {
        case "Slash": return sSwordSpr;
        case "Twinblade": return sTwinblade;
        case "Javelin": return sJavelin;
        case "Bow": return sShortbow;
    }
}