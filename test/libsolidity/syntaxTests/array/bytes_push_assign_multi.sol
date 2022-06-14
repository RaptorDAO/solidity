contract C {
    bytes x;
    bytes z;
    function f() public {
        (x.push(), x.push()) = (0, 0);
        (((x.push())), (x.push())) = (0, 0);
        ((x.push(), x.push()), x.push()) = ((0, 0), 0);
        (x.push(), x[0]) = (0, 0);
        bytes storage y = x;
        (x.push(), y.push()) = (0, 0);
        // The following is a false positive.
        (x.push(), z.push()) = (0, 0);
    }
}
// ----
// Warning 7239: (73-101): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
// Warning 7239: (111-145): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
// Warning 7239: (155-200): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
// Warning 7239: (210-235): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
// Warning 7239: (274-302): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
// Warning 7239: (358-386): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation one element at a time.
