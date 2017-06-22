function pressure_reducing_vlv(root, schema)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.descriptor = 'Pressure Reducing Valve';
    % 20 22
    % 21 22
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.5]};
    % 26 27
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Bottom';[0.5]};
    % 31 33
    % 32 33
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 37 38
    pres_set = schema.parameter('pres_set');
    pres_set.description = 'Valve pressure setting';
    pres_set.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_set.default = 5e+06;
    % 42 43
    reg_range = schema.parameter('reg_range');
    reg_range.description = 'Valve regulation range';
    reg_range.type = ne_type('real', [1.0 1.0], 'Pa');
    reg_range.default = 500000.0;
    % 47 48
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 52 53
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 57 58
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    schema.setup(@setup);
    % 68 69
end % function
function setup(root, pr_red)
    % 71 74
    % 72 74
    % 73 74
    x_area_max = pr_red.area_max.check('>', 0.0);
    x_pres_set = pr_red.pres_set.check('>', 0.0);
    x_reg_range = pr_red.reg_range.check('>', 0.0);
    x_C_d = pr_red.C_d.check('>', 0.0, pr_red.C_d.default);
    x_Re_cr = pr_red.Re_cr.check('>', 0.0, pr_red.Re_cr.default);
    x_A_leak = pr_red.A_leak.check('>=', 0.0, pr_red.A_leak.default);
    % 80 83
    % 81 83
    % 82 83
    pr_comp = pr_red.element('pr_comp', root.sh.valves.pressure_control_valves.pressure_compensator);
    % 84 85
    pr_comp.area_max = x_area_max;
    pr_comp.pres_set = x_pres_set;
    pr_comp.reg_range = x_reg_range;
    pr_comp.Re_cr = x_Re_cr;
    pr_comp.C_d = x_C_d;
    pr_comp.A_leak = x_A_leak;
    % 91 93
    % 92 93
    pr_red.connect(pr_comp.A, pr_red.A);
    pr_red.connect(pr_comp.B, pr_red.B);
    pr_red.connect(pr_comp.X, pr_red.B);
    pr_red.connect(pr_comp.Y);
    % 97 98
end % function
