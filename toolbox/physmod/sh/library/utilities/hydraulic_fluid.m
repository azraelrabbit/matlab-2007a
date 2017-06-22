function hydraulic_fluid(root, schema)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    schema.descriptor = 'Hydraulic Fluid';
    % 11 14
    % 12 14
    A = schema.terminal('G');
    A.description = 'port';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = '';
    A.location = 'right';
    % 18 22
    % 19 22
    % 20 22
    dataSrc = schema.parameter('DataSource');
    dataSrc.description = 'Source database file';
    dataSrc.type = ne_type('real', [1.0 1.0], '1');
    dataSrc.default = 1.0;
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    selectFluid = schema.parameter('SelFluid');
    selectFluid.description = 'Hydraulic fluid index';
    selectFluid.type = ne_type('real', [1.0 1.0], '1');
    selectFluid.default = 1.0;
    % 37 39
    sysTemp = schema.parameter('SysTemp');
    sysTemp.description = 'System temperature';
    sysTemp.type = ne_type('real', [1.0 1.0], 'c');
    sysTemp.default = 60.0;
    % 42 44
    selectFluid = schema.parameter('TrapAir');
    selectFluid.description = 'Relative amount of trapped air';
    selectFluid.type = ne_type('real', [1.0 1.0], '1');
    selectFluid.default = .005;
    % 47 51
    % 48 51
    % 49 51
    schema.setup(@setup);
    % 51 53
end
function setup(root, fl_props)
    % 54 56
    fl_props.branch_through('q', fl_props.G.q, []);
    % 56 58
    info = sh_stockfluidproperties;
    ids = fieldnames(info);
    idx = fl_props.SelFluid.value;
    % 60 62
    [viscosity_kin, density, bulk] = info.(ids{idx}).prop(fl_props.SysTemp.value);
    % 62 64
    fl_props.G.density.share(cellhorzcat(density, 'kg/m^2'));
    fl_props.G.viscosity_kin.share(cellhorzcat(viscosity_kin, 'm^2/s'));
    fl_props.G.bulk.share(cellhorzcat(bulk, 'Pa'));
    fl_props.G.alpha.share(fl_props.TrapAir);
    % 67 69
    fl_props.equation(@equation);
end
function e = equation(sys, fl_props)
    % 71 73
    e = sys.equation;
    % 73 77
    % 74 77
    % 75 77
    e(1.0) = fl_props.q;
end
