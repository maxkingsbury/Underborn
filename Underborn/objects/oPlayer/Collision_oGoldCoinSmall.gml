if (instance_exists(oUpgrade)){ exit; }

global.coinsThisRound += 1;
global.coins += 1;

instance_destroy(other.id);