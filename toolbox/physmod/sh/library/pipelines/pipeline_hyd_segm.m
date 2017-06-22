function pipeline_hyd_segm(root, schema)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    schema.descriptor = 'Segmented Pipeline';
    % 23 26
    % 24 26
    A = schema.terminal('A');
    A.description = 'Pipeline inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 29 31
    B = schema.terminal('B');
    B.description = 'Pipeline outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 34 37
    % 35 37
    d_in = schema.parameter('d_in');
    d_in.description = 'Pipe internal diameter';
    d_in.type = ne_type('real', [1.0 1.0], 'm');
    d_in.default = .01;
    % 40 42
    length = schema.parameter('length');
    length.description = 'Pipe length';
    length.type = ne_type('real', [1.0 1.0], 'm');
    length.default = 5.0;
    % 45 47
    segm_num = schema.parameter('segm_num');
    segm_num.description = 'Number of segments';
    segm_num.type = ne_type('real', [1.0 1.0], '1');
    segm_num.default = 1.0;
    % 50 52
    length_ad = schema.parameter('length_ad');
    length_ad.description = 'Aggregate equivalent length of local resistances';
    length_ad.type = ne_type('real', [1.0 1.0], 'm');
    length_ad.default = 1.0;
    % 55 57
    roughness = schema.parameter('roughness');
    roughness.description = 'Internal surface roughness height';
    roughness.type = ne_type('real', [1.0 1.0], 'm');
    roughness.default = 1.5e-05;
    % 60 62
    Re_lam = schema.parameter('Re_lam');
    Re_lam.description = 'Laminar flow upper margin';
    Re_lam.type = ne_type('real', [1.0 1.0], '1');
    Re_lam.default = 2000.0;
    % 65 67
    Re_turb = schema.parameter('Re_turb');
    Re_turb.description = 'Turbulent flow lower margin';
    Re_turb.type = ne_type('real', [1.0 1.0], '1');
    Re_turb.default = 4000.0;
    % 70 72
    wall_type = schema.parameter('wall_type');
    wall_type.description = 'Pipe wall type';
    wall_type.type = ne_type('real', [1.0 1.0], '1');
    wall_type.default = 1.0;
    % 75 77
    pr_r_coef = schema.parameter('pr_r_coef');
    pr_r_coef.description = 'Static pressure-diameter coefficient';
    pr_r_coef.type = ne_type('real', [1.0 1.0], 'm/Pa');
    pr_r_coef.default = 2e-10;
    % 80 82
    time_const = schema.parameter('time_const');
    time_const.description = 'Viscoelastic process time constant';
    time_const.type = ne_type('real', [1.0 1.0], 's');
    time_const.default = .008;
    % 85 87
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 90 92
    schema.setup(@setup);
end % function
function setup(root, pipe)
    % 94 98
    % 95 98
    % 96 98
    x_d_in = pipe.d_in.check('>', 0.0);
    x_length = pipe.length.check('>', 0.0);
    x_length_ad = pipe.length_ad.check('>=', 0.0);
    x_roughness = pipe.roughness.check('>=', 0.0);
    x_Re_lam = pipe.Re_lam.check('>', 0.0);
    x_Re_turb = pipe.Re_turb.check('>', x_Re_lam);
    x_segm_num = pipe.segm_num.check('>=', 1.0);
    x_pr_r_coef = pipe.pr_r_coef.check('>', 0.0, pipe.pr_r_coef.default);
    x_time_constant = pipe.time_const.check('>', 0.0, pipe.time_const.default);
    x_k_sh = pipe.k_sh.check('>=', 1.0, pipe.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, pipe.k_sh.default);
    % 108 110
    x_area = mrdivide(mtimes(mtimes(3.141592653589793, x_d_in), x_d_in), 4.0);
    x_fl_volume = mtimes(x_area, x_length);
    % 111 113
    n = pipe.segm_num.value;
    % 113 120
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    n_0 = pipe.node('n_0', root.fl.hydraulic.hydraulic);
    N_1 = pipe.node('N_1', root.fl.hydraulic.hydraulic);
    % 121 123
    tb_0 = pipe.element('tb_0', root.fl.hydraulic.elements.resistive_tube);
    % 123 125
    tb_0.cs_type = 1.0;
    tb_0.d_in = x_d_in;
    tb_0.length = mrdivide(x_length, plus(x_segm_num, 1.0));
    tb_0.length_ad = mrdivide(x_length_ad, plus(x_segm_num, 1.0));
    tb_0.roughness = x_roughness;
    tb_0.Re_lam = x_Re_lam;
    tb_0.Re_turb = x_Re_turb;
    % 131 133
    fl_in_0 = pipe.element('fl_in_0', root.fl.hydraulic.elements.fluid_inertia);
    % 133 135
    fl_in_0.area = x_area;
    fl_in_0.length = mrdivide(x_length, plus(x_segm_num, 1.0));
    % 136 138
    pipe.connect(tb_0.A, pipe.A);
    pipe.connect(tb_0.B, n_0);
    pipe.connect(fl_in_0.A, n_0);
    pipe.connect(fl_in_0.B, N_1);
    % 141 145
    % 142 145
    % 143 145
    for i=1.0:n
        suffix = int2str(i);
        suffix_1 = int2str(plus(i, 1.0));
        % 147 149
        intNode = pipe.node(horzcat('nn_', suffix), root.fl.hydraulic.hydraulic);
        % 149 151
        if eq(i, 1.0)
            intSegmNode_1 = pipe.N_1;
            if eq(i, n)
                intSegmNode_2 = pipe.B;
            else
                intSegmNode_2 = pipe.node(horzcat('N_', suffix_1), root.fl.hydraulic.hydraulic);
                % 156 158
            end % if
        else
            if lt(i, n)
                intSegmNode_1 = intSegmNode_2;
                intSegmNode_2 = pipe.node(horzcat('N_', suffix_1), root.fl.hydraulic.hydraulic);
            else
                % 163 165
                intSegmNode_1 = intSegmNode_2;
                intSegmNode_2 = pipe.B;
            end % if
            % 167 170
            % 168 170
        end % if
        ch = pipe.element(horzcat('ch_', suffix), root.fl.hydraulic.elements.chamber_const);
        ch.wall_type = pipe.wall_type;
        ch.ch_volume = mrdivide(x_fl_volume, x_segm_num);
        ch.d_in = x_d_in;
        ch.length = mrdivide(x_length, x_segm_num);
        ch.pr_r_coef = x_pr_r_coef;
        ch.time_const = x_time_constant;
        ch.k_sh = x_k_sh;
        % 178 180
        fl_in = pipe.element(horzcat('fl_in_', suffix), root.fl.hydraulic.elements.fluid_inertia);
        % 180 182
        fl_in.area = x_area;
        fl_in.length = mrdivide(x_length, plus(x_segm_num, 1.0));
        % 183 185
        tb = pipe.element(horzcat('tb_', suffix), root.fl.hydraulic.elements.resistive_tube);
        % 185 187
        tb.d_in = x_d_in;
        tb.length = mrdivide(x_length, plus(x_segm_num, 1.0));
        tb.length_ad = mrdivide(x_length_ad, plus(x_segm_num, 1.0));
        tb.roughness = x_roughness;
        tb.Re_lam = x_Re_lam;
        tb.Re_turb = x_Re_turb;
        % 192 194
        pipe.connect(ch.A, intSegmNode_1);
        pipe.connect(fl_in.A, intSegmNode_1);
        pipe.connect(fl_in.B, intNode);
        pipe.connect(tb.A, intNode);
        pipe.connect(tb.B, intSegmNode_2);
        % 198 200
    end % for
    % 200 202
end % function
