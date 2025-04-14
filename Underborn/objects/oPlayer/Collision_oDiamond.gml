if (instance_exists(oUpgrade)){ exit; }

global.diamonds += 1;

instance_destroy(other.id);