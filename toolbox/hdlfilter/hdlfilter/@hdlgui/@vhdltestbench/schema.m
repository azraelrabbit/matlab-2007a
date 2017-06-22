function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'vhdltestbench', pk.findclass('abstracthdlgui'));
    set(c, 'Description', 'Test bench settings');
    % 11 12
    p = schema.prop(c, 'TestBenchName', 'string');
    set(p, 'FactoryValue', 'filter_tb', 'Description', 'Name');
    % 14 15
    p = schema.prop(c, 'VHDL', 'on/off');
    set(p, 'Description', 'VHDL file', 'FactoryValue', 'on');
    % 17 18
    p = schema.prop(c, 'Verilog', 'on/off');
    set(p, 'Description', 'Verilog file');
    % 20 21
    p = schema.prop(c, 'ModelSim', 'on/off');
    set(p, 'Description', 'ModelSim .do file');
    % 23 24
    schema.prop(c, 'EnableModelSim', 'on/off');
    % 25 26
    p = schema.prop(c, 'LinkforModelSim', 'on/off');
    set(p, 'Description', 'Link for ModelSim .m file');
    % 28 29
    p = schema.prop(c, 'Simulink', 'on/off');
    set(p, 'Description', 'Link for ModelSim Simulink Model');
    % 31 32
    p = schema.prop(c, 'Filter', 'mxArray');
    % 33 34
    p = vertcat(schema.prop(c, 'PluginTestBenches', 'string vector'), schema.prop(c, 'DialogAppliedListener', 'handle.listener vector'));
    % 35 38
    % 36 38
    % 37 38
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
