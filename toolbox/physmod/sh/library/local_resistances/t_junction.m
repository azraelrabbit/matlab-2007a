function t_junction(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    schema.descriptor = 'T-junction';
    % 17 20
    % 18 20
    A = schema.terminal('A');
    A.description = 'A port';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 23 25
    A1 = schema.terminal('A1');
    A1.description = 'A1 port';
    A1.domain = root.fl.hydraulic.hydraulic;
    A1.location = {'Left';[0.75]};
    % 28 30
    B = schema.terminal('B');
    B.description = 'B port';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 33 37
    % 34 37
    % 35 37
    d_ab = schema.parameter('main_diam');
    d_ab.description = 'Main pipe diameter';
    d_ab.type = ne_type('real', [1.0 1.0], 'm');
    d_ab.default = .01;
    % 40 42
    d_a1 = schema.parameter('branch_diam');
    d_a1.description = 'Branch pipe diameter';
    d_a1.type = ne_type('real', [1.0 1.0], 'm');
    d_a1.default = .01;
    % 45 47
    ab = schema.parameter('kp_ab');
    ab.description = 'A-B pressure loss coefficient';
    ab.type = ne_type('real', [1.0 1.0], '1');
    ab.default = 1.12;
    % 50 52
    ba = schema.parameter('kp_ba');
    ba.description = 'B-A pressure loss coefficient';
    ba.type = ne_type('real', [1.0 1.0], '1');
    ba.default = 1.12;
    % 55 57
    aa1 = schema.parameter('kp_aa1');
    aa1.description = 'A-A1 pressure loss coefficient';
    aa1.type = ne_type('real', [1.0 1.0], '1');
    aa1.default = 1.36;
    % 60 62
    a1a = schema.parameter('kp_a1a');
    a1a.description = 'A1-A pressure loss coefficient';
    a1a.type = ne_type('real', [1.0 1.0], '1');
    a1a.default = 1.65;
    % 65 67
    a1b = schema.parameter('kp_a1b');
    a1b.description = 'A1-B pressure loss coefficient';
    a1b.type = ne_type('real', [1.0 1.0], '1');
    a1b.default = 1.6;
    % 70 72
    ba1 = schema.parameter('kp_ba1');
    ba1.description = 'B-A1 pressure loss coefficient';
    ba1.type = ne_type('real', [1.0 1.0], '1');
    ba1.default = 1.8;
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    schema.setup(@setup);
    % 80 82
end % function
function setup(root, t_junc)
    % 83 87
    % 84 87
    % 85 87
    x_main_diam = t_junc.main_diam.check('>', 0.0);
    x_branch_diam = t_junc.branch_diam.check('>', 0.0);
    % 88 90
    x_main_area = mrdivide(mtimes(mtimes(3.141592653589793, x_main_diam), x_main_diam), 4.0);
    x_branch_area = mrdivide(mtimes(mtimes(3.141592653589793, x_branch_diam), x_branch_diam), 4.0);
    x_kp_ab = t_junc.kp_ab.check('>=', 0.0, t_junc.kp_ab.default);
    x_kp_ba = t_junc.kp_ba.check('>=', 0.0, t_junc.kp_ba.default);
    x_kp_aa1 = t_junc.kp_aa1.check('>=', 0.0, t_junc.kp_aa1.default);
    x_kp_a1a = t_junc.kp_a1a.check('>=', 0.0, t_junc.kp_a1a.default);
    x_kp_a1b = t_junc.kp_a1b.check('>=', 0.0, t_junc.kp_a1b.default);
    x_kp_ba1 = t_junc.kp_ba1.check('>=', 0.0, t_junc.kp_ba1.default);
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    l_res_ab = t_junc.element('l_res_ab', root.sh.local_resistances.local_resistance);
    % 104 106
    l_res_ab.area = x_main_area;
    l_res_ab.kp_d = x_kp_ab;
    l_res_ab.kp_r = x_kp_ba;
    % 108 110
    l_res_aa1 = t_junc.element('l_res_aa1', root.sh.local_resistances.local_resistance);
    % 110 112
    l_res_aa1.area = x_branch_area;
    l_res_aa1.kp_d = x_kp_aa1;
    l_res_aa1.kp_r = x_kp_a1a;
    % 114 116
    l_res_a1b = t_junc.element('l_res_a1b', root.sh.local_resistances.local_resistance);
    % 116 118
    l_res_a1b.area = x_branch_area;
    l_res_a1b.kp_d = x_kp_a1b;
    l_res_a1b.kp_r = x_kp_ba1;
    % 120 123
    % 121 123
    t_junc.connect(l_res_ab.A, t_junc.A);
    t_junc.connect(l_res_ab.B, t_junc.B);
    t_junc.connect(l_res_aa1.A, t_junc.A);
    t_junc.connect(l_res_aa1.B, t_junc.A1);
    t_junc.connect(l_res_a1b.A, t_junc.A1);
    t_junc.connect(l_res_a1b.B, t_junc.B);
    % 128 130
end % function
