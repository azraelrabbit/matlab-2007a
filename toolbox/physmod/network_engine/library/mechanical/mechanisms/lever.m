function lever(root, schema)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.descriptor = 'Lever';
    % 21 23
    % 22 23
    A = schema.terminal('A');
    A.description = 'Lever joint A';
    A.domain = root.fl.mechanical.translational.translational;
    A.location = {'Left';[0.25]};
    % 27 28
    B = schema.terminal('B');
    B.description = 'Lever joint B';
    B.domain = root.fl.mechanical.translational.translational;
    B.location = {'Left';[0.75]};
    % 32 33
    C = schema.terminal('C');
    C.description = 'Lever joint C';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.5]};
    % 37 39
    % 38 39
    arm_AC = schema.parameter('arm_AC');
    arm_AC.description = 'AC arm length';
    arm_AC.type = ne_type('real', [1.0 1.0], 'm');
    arm_AC.default = .1;
    % 43 44
    arm_BC = schema.parameter('arm_BC');
    arm_BC.description = 'BC arm length';
    arm_BC.type = ne_type('real', [1.0 1.0], 'm');
    arm_BC.default = .1;
    % 48 50
    % 49 50
    var_int_A = schema.local_variable('force_A');
    var_int_A.description = 'Joint A force (N)';
    % 52 53
    var_int_B = schema.local_variable('force_B');
    var_int_B.description = 'Joint B force (N)';
    % 55 56
    var_int_C = schema.local_variable('force_C');
    var_int_C.description = 'Joint C force (N)';
    % 58 59
    var_int_vA = schema.local_variable('velocity_A');
    var_int_vA.description = 'Joint A velocity (m/s)';
    % 61 62
    var_int_vB = schema.local_variable('velocity_B');
    var_int_vB.description = 'Joint B velocity (m/s) ';
    % 64 65
    var_int_vC = schema.local_variable('velocity_C');
    var_int_vC.description = 'Joint C velocity (m/s)';
    % 67 68
    schema.setup(@setup);
    % 69 70
end % function
function setup(root, lever)
    % 72 74
    % 73 74
    lever.branch_across('v_A', lever.A.v, []);
    lever.branch_through('f_A', lever.A.f, []);
    % 76 77
    lever.branch_across('v_B', lever.B.v, []);
    lever.branch_through('f_B', lever.B.f, []);
    % 79 80
    lever.branch_across('v_C', lever.C.v, []);
    lever.branch_through('f_C', lever.C.f, []);
    % 82 84
    % 83 84
    lever.parameter('x_arm_AC', lever.arm_AC.check('>', 0.0));
    lever.parameter('x_arm_BC', lever.arm_BC.check('>', 0.0));
    % 86 88
    % 87 88
    k_AC = mrdivide(lever.arm_BC, plus(lever.arm_AC, lever.arm_BC));
    k_BC = mrdivide(lever.arm_AC, plus(lever.arm_AC, lever.arm_BC));
    lever.parameter('k_AC', k_AC);
    lever.parameter('k_BC', k_BC);
    % 92 93
    lever.equation(@equation);
end % function
function e = equation(sys, lever)
    % 96 98
    % 97 98
    e = sys.equation;
    % 99 101
    % 100 101
    k_AC = lever.k_AC;
    k_BC = lever.k_BC;
    % 103 104
    force_A = lever.f_A;
    force_B = lever.f_B;
    force_C = lever.f_C;
    % 107 108
    velocity_A = lever.v_A;
    velocity_B = lever.v_B;
    velocity_C = lever.v_C;
    % 111 112
    e(1.0) = minus(minus(velocity_C, mtimes(k_AC, velocity_A)), mtimes(k_BC, velocity_B));
    e(2.0) = plus(force_A, mtimes(k_AC, force_C));
    e(3.0) = plus(force_B, mtimes(k_BC, force_C));
    % 115 116
end % function
