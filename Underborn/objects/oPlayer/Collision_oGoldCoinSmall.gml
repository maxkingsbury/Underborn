if (instance_exists(oUpgrade)){ exit; }

global.coins += 1;

instance_destroy(other.id);