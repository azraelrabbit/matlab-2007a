function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    mlock;
    % 11 13
    % 12 13
    pir_udd;
    parentPkg = findpackage('hdlcoder');
    parent = findclass(parentPkg, 'HDLImplementationM');
    findclass(parentPkg, 'network');
    findclass(parentPkg, 'component');
    % 18 20
    % 19 20
    package = findpackage('hdlbuiltinimpl');
    this = schema.class(package, 'HDLDirectCodeGen', parent);
    % 22 24
    % 23 24
    if isempty(findtype('HDLCodeGenMode'))
        schema.EnumType('HDLCodeGenMode', {'hdlemission','vhdlemission','vhdlinstantiation','verilogemission','veriloginstantiation'});
        % 26 32
        % 27 32
        % 28 32
        % 29 32
        % 30 32
        % 31 32
    end % if
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    if isempty(findtype('HDLEmissionHandleType'))
        schema.EnumType('HDLEmissionHandleType', {'useslhandle','usecomphandle','useobjandcomphandles'});
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        % 43 44
    end % if
    % 45 47
    % 46 47
    m = schema.method(this, 'getBlocks');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'MATLAB array'};
    % 52 53
    m = schema.method(this, 'getDescription');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'MATLAB array'};
    % 58 59
    m = schema.method(this, 'elaborate');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','hdlcoder.network','hdlcoder.component'};
    s.OutputTypes = {};
    % 64 66
    % 65 66
    p = schema.prop(this, 'CodeGenFunction', 'mxArray');
    p.FactoryValue = 'emit';
    % 68 69
    p = schema.prop(this, 'FirstParam', 'HDLEmissionHandleType');
    p.FactoryValue = 'useobjandcomphandles';
    % 71 72
    p = schema.prop(this, 'CodeGenParams', 'mxArray');
    p.FactoryValue = [];
    % 74 75
    p = schema.prop(this, 'validateFunction', 'mxArray');
    p.FactoryValue = 'validate';
    % 77 78
    p = schema.prop(this, 'validateParams', 'mxArray');
    p.FactoryValue = {};
    % 80 81
    p = schema.prop(this, 'estimateFunction', 'mxArray');
    p.FactoryValue = 'estimate';
    % 83 84
    p = schema.prop(this, 'estimateParams', 'mxArray');
    p.FactoryValue = {};
    % 86 87
    schema.prop(this, 'Blocks', 'string vector');
    schema.prop(this, 'Description', 'mxArray');
    % 89 90
    p = schema.prop(this, 'CodeGenMode', 'HDLCodeGenMode');
    p.FactoryValue = 'vhdlemission';
    % 92 93
    p = schema.prop(this, 'generateSLBlockFunction', 'mxArray');
    p.FactoryValue = 'generateSLBlock';
    % 95 96
    p = schema.prop(this, 'controlFileParams', 'mxArray');
    p.FactoryValue = {};
end % function
