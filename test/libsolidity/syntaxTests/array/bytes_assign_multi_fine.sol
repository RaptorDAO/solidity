contract C {
	bytes x;
	function f() public {
		(x[0], x[1]) = (0, 0);
	}
}
// ----
