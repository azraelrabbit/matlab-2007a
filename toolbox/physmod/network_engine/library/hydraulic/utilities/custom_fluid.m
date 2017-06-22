function custom_fluid(root, schema)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    schema.descriptor = 'Custom Hydraulic Fluid';
    % 11 14
    % 12 14
    A = schema.terminal('G');
    A.description = 'port';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = '';
    A.location = 'right';
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    hydraulic = root.fl.hydraulic.hydraulic;
    items = hydraulic.items;
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    for i=1.0:length(items)
        if strcmp(hydraulic.(items{i}).item_type, 'parameter')
            % 38 42
            % 39 42
            % 40 42
            p = schema.parameter(items{i});
            p.type = hydraulic.(items{i}).type;
            p.description = hydraulic.(items{i}).description;
            p.default = hydraulic.(items{i}).default;
        end
    end % for
    % 47 50
    % 48 50
    schema.setup(@setup);
    % 50 52
end
function setup(root, fl_props)
    % 53 55
    fl_props.branch_through('q', fl_props.G.q, []);
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    hydraulic = root.fl.hydraulic.hydraulic;
    items = hydraulic.items;
    for i=1.0:length(items)
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        if strcmp(hydraulic.(items{i}).item_type, 'parameter')
            fl_props.(items{i}).share(fl_props.G.(items{i}));
        end
    end % for
    % 70 73
    % 71 73
    fl_props.density.check('>', 0.0);
    fl_props.viscosity_kin.check('>', 0.0);
    fl_props.bulk.check('>', 0.0);
    fl_props.alpha.check('>', 0.0);
    % 76 79
    % 77 79
    fl_props.equation(@equation);
end
function e = equation(sys, fl_props)
    % 81 83
    e = sys.equation;
    % 83 87
    % 84 87
    % 85 87
    e(1.0) = fl_props.q;
end
