function gradual_area_change(root, schema)
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
    schema.descriptor = 'Gradual Area Change';
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
    area_in = schema.parameter('small_diam');
    area_in.description = 'Small diameter';
    area_in.type = ne_type('real', [1.0 1.0], 'm');
    area_in.default = .01;
    % 41 43
    area_out = schema.parameter('large_diam');
    area_out.description = 'Large diameter';
    area_out.type = ne_type('real', [1.0 1.0], 'm');
    area_out.default = .02;
    % 46 48
    ang = schema.parameter('angle');
    ang.description = 'Cone angle';
    ang.type = ne_type('real', [1.0 1.0], 'deg');
    ang.default = 30.0;
    % 51 54
    % 52 54
    mdt = schema.parameter('mdl_type');
    % 54 58
    % 55 58
    % 56 58
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 60 62
    kp_c = schema.parameter('kp_c');
    kp_c.description = 'Correction coefficient';
    kp_c.type = ne_type('real', [1.0 1.0], '1');
    kp_c.default = 1.0;
    % 65 67
    Re = schema.parameter('Re_vec');
    Re.description = 'Reynolds number vector';
    Re.type = ne_type('real', 'variable', '1');
    Re.default = [-10000.0 -5000.0 -4000.0 -2000.0 -1000.0 -500.0 -200.0 -100.0 -50.0 -40.0 -30.0 -20.0 -10.0 10.0 20.0 30.0 40.0 50.0 100.0 200.0 500.0 1000.0 2000.0 4000.0 5000.0 10000.0];
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    cnt = schema.parameter('loss_coeff_vec');
    cnt.description = 'Loss coefficient vector';
    cnt.type = ne_type('real', 'variable', '1');
    cnt.default = [.05 .05 .06 .09 .15 .26 .4 .61 .91 1.12 1.48 2.23 4.4 4.0 1.9 1.26 .94 .76 .52 .48 .42 .36 .24 .4 .42 .35];
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 2.0;
    % 86 88
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 2.0;
    % 91 95
    % 92 95
    % 93 95
    schema.setup(@setup);
    % 95 97
end % function
function setup(root, grad_ar_ch)
    % 98 102
    % 99 102
    % 100 102
    x_kp_c = grad_ar_ch.kp_c.check('>', 0.0, grad_ar_ch.kp_c.default);
    x_small_diam = grad_ar_ch.small_diam.check('>', 0.0);
    area = mrdivide(mtimes(mtimes(3.141592653589793, x_small_diam), x_small_diam), 4.0);
    % 104 106
    if eq(grad_ar_ch.mdl_type, 1.0)
        x_large_diam = grad_ar_ch.large_diam.check('>', x_small_diam);
        x_angle = grad_ar_ch.angle.check('>', 0.0).check('<', {[180.0],'deg'});
        area_ratio = mrdivide(mpower(x_small_diam, 2.0), mpower(x_large_diam, 2.0));
        loss_coeff_d = mtimes(x_kp_c, mpower(minus(1.0, area_ratio), 2.0));
        loss_coeff_r = mtimes(mtimes(x_kp_c, .5), mpower(minus(1.0, area_ratio), .75));
        % 111 114
        % 112 114
        a = mrdivide(mtimes(mrdivide(x_angle.value, 2.0), 3.141592653589793), 180.0);
        % 114 117
        % 115 117
        sin_appr = minus(plus(minus(a, mrdivide(mpower(a, 3.0), 6.0)), mrdivide(mpower(a, 5.0), 120.0)), mrdivide(mpower(a, 7.0), 5040.0));
        encl_angle = {[45.0],'deg'};
        if lt(x_angle, encl_angle)
            loss_coeff_d = mtimes(mtimes(loss_coeff_d, 2.6), sin_appr);
            loss_coeff_r = mtimes(mtimes(loss_coeff_r, 1.6), sin_appr);
        else
            loss_coeff_d = loss_coeff_d;
            loss_coeff_r = mtimes(loss_coeff_r, mpower(sin_appr, .5));
        end % if
        loc_res = grad_ar_ch.element('loc_res', root.sh.local_resistances.local_resistance);
        % 126 128
        loc_res.area = area;
        loc_res.kp_d = loss_coeff_d;
        loc_res.kp_r = loss_coeff_r;
        loc_res.mdl_type = grad_ar_ch.mdl_type;
    else
        % 132 134
        % 133 138
        % 134 138
        % 135 138
        % 136 138
        Re_t = grad_ar_ch.Re_vec.value;
        c_t = grad_ar_ch.loss_coeff_vec.value;
        % 139 141
        if ne(length(Re_t), length(c_t))
            error('Vectors of Reynolds numbers and loss coefficients must be of the same size!');
            % 142 144
        end % if
        % 144 146
        num_el = length(Re_t);
        if le(num_el, 3.0)
            error('The size of the table must be greater than 3!');
        end % if
        % 149 151
        for i=1.0:minus(num_el, 1.0)
            if ge(Re_t(i), Re_t(plus(i, 1.0)))
                error('Reynolds numbers must be arranged in strictly ascending order!');
                % 153 155
            end % if
        end % for
        % 156 158
        loc_res = grad_ar_ch.element('loc_res', root.sh.local_resistances.local_resistance);
        % 158 160
        loc_res.area = area;
        loc_res.mdl_type = grad_ar_ch.mdl_type;
        loc_res.Re_vec = grad_ar_ch.Re_vec;
        loc_res.loss_coeff_vec = grad_ar_ch.loss_coeff_vec;
        loc_res.interp_method = grad_ar_ch.interp_method;
        loc_res.extrap_method = grad_ar_ch.extrap_method;
    end % if
    % 166 169
    % 167 169
    grad_ar_ch.connect(loc_res.A, grad_ar_ch.A);
    grad_ar_ch.connect(loc_res.B, grad_ar_ch.B);
    % 170 172
end % function
