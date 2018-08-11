

module gray() {
	color([.4, .4, .4]) children([0:$children-1]);
}

module black() {
	color([.3, .3, .3]) children([0:$children-1]);
}

module orange() {
	color([1, .7, 0]) children([0:$children-1]);
}

module yellow() {
	color([.7, .7, .3]) children([0:$children-1]);
}

module green_pcb() {
	color([.0, .5, .25]) children([0:$children-1]);
}

module metal() {
	color([.7, .7, .7]) children([0:$children-1]);
}

module gold() {
	color([.8, .5, .0]) children([0:$children-1]);
}

module stainless(no="1.4301") {
	color([0.45, 0.43, 0.5]) children([0:$children-1]);
}

module steel(no) {
	color([0.65, 0.67, 0.72]) children([0:$children-1]);
}

module iron(no="ST37") {
	color([0.36, 0.33, 0.33]) children([0:$children-1]);
}

module plastic() {
	color([1, .7, 0]) children([0:$children-1]);
}
