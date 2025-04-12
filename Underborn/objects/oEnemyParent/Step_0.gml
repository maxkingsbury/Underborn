

with (oEnemyParent) {
	var push_strength = 0;
    if (id != other.id) { // Don't compare with self
        var dx = x - other.x;
        var dy = y - other.y;
        var dist = point_distance(x, y, other.x, other.y);

        if (dist < 16 && dist > 0) {
			if (scale > 1) {
				push_strength = 2;
			} else {
				push_strength = 2;
			}
            var force = push_strength * (16 - dist) / 16;

            // Move only this enemy (not the player)
            x += (dx / dist) * force;
            y += (dy / dist) * force;
        }
    }
}