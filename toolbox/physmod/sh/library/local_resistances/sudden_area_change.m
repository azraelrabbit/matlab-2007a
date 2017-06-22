function sudden_area_change(root, schema)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    schema.descriptor = 'Sudden Area Change';
    % 24 27
    % 25 27
    A = schema.terminal('A');
    A.description = 'Resistance inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 30 32
    B = schema.terminal('B');
    B.description = 'Resistance outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 35 38
    % 36 38
    ds = schema.parameter('small_diam');
    ds.description = 'Small diameter';
    ds.type = ne_type('real', [1.0 1.0], 'm');
    ds.default = .01;
    % 41 43
    dl = schema.parameter('large_diam');
    dl.description = 'Large diameter';
    dl.type = ne_type('real', [1.0 1.0], 'm');
    dl.default = .02;
    % 46 48
    mdt = schema.parameter('mdl_type');
    % 48 51
    % 49 51
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 53 55
    kp_c = schema.parameter('kp_c');
    kp_c.description = 'Correction coefficient';
    kp_c.type = ne_type('real', [1.0 1.0], '1');
    kp_c.default = 1.0;
    % 58 60
    Re = schema.parameter('Re_vec');
    Re.description = 'Reynolds number vector';
    Re.type = ne_type('real', 'variable', '1');
    Re.default = [-4000.0 -3000.0 -2000.0 -1000.0 -500.0 -200.0 -100.0 -50.0 -40.0 -30.0 -20.0 -15.0 -10.0 10.0 20.0 30.0 40.0 50.0 100.0 200.0 500.0 1000.0 2000.0 4000.0 5000.0 10000.0];
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    cnt = schema.parameter('loss_coeff_vec');
    cnt.description = 'Loss coefficient vector';
    cnt.type = ne_type('real', 'variable', '1');
    cnt.default = [.25 .3 .65 .9 .65 .75 .9 1.15 1.35 1.65 2.3 2.8 3.1 5.0 2.7 1.8 1.46 1.3 .9 .65 .42 .3 .2 .4 .42 .25];
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 2.0;
    % 79 81
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 2.0;
    % 84 88
    % 85 88
    % 86 88
    schema.setup(@setup);
    % 88 90
end % function
function setup(root, sud_ar_ch)
    % 91 95
    % 92 95
    % 93 95
    x_small_diam = sud_ar_ch.small_diam.check('>', 0.0);
    x_kp_c = sud_ar_ch.kp_c.check('>', 0.0, sud_ar_ch.kp_c.default);
    area = mrdivide(mtimes(mtimes(3.141592653589793, x_small_diam), x_small_diam), 4.0);
    % 97 99
    if eq(sud_ar_ch.mdl_type, 1.0)
        x_large_diam = sud_ar_ch.large_diam.check('>', x_small_diam);
        area_ratio = mrdivide(mpower(x_small_diam, 2.0), mpower(x_large_diam, 2.0));
        loss_coeff_d = mtimes(x_kp_c, mpower(minus(1.0, area_ratio), 2.0));
        loss_coeff_r = mtimes(mtimes(x_kp_c, .5), mpower(minus(1.0, area_ratio), .75));
        % 103 105
        loc_res = sud_ar_ch.element('loc_res', root.sh.local_resistances.local_resistance);
        % 105 107
        loc_res.area = area;
        loc_res.kp_d = loss_coeff_d;
        loc_res.kp_r = loss_coeff_r;
        loc_res.mdl_type = sud_ar_ch.mdl_type;
    else
        % 111 115
        % 112 115
        % 113 115
        Re_t = sud_ar_ch.Re_vec.value;
        c_t = sud_ar_ch.loss_coeff_vec.value;
        % 116 118
        if ne(length(Re_t), length(c_t))
            error('Vectors of Reynolds numbers and loss coefficients must be of the same size!');
            % 119 121
        end % if
        % 121 123
        num_el = length(Re_t);
        if le(num_el, 3.0)
            error('The size of the table must be greater than 3!');
        end % if
        % 126 128
        for i=1.0:minus(num_el, 1.0)
            if ge(Re_t(i), Re_t(plus(i, 1.0)))
                error('Reynolds numbers must be arranged in strictly ascending order!');
                % 130 132
            end % if
        end % for
        % 133 135
        loc_res = sud_ar_ch.element('loc_res', root.sh.local_resistances.local_resistance);
        % 135 137
        loc_res.area = area;
        loc_res.mdl_type = sud_ar_ch.mdl_type;
        loc_res.Re_vec = sud_ar_ch.Re_vec;
        loc_res.loss_coeff_vec = sud_ar_ch.loss_coeff_vec;
        loc_res.interp_method = sud_ar_ch.interp_method;
        loc_res.extrap_method = sud_ar_ch.extrap_method;
    end % if
    % 143 146
    % 144 146
    sud_ar_ch.connect(loc_res.A, sud_ar_ch.A);
    sud_ar_ch.connect(loc_res.B, sud_ar_ch.B);
    % 147 149
end % function
