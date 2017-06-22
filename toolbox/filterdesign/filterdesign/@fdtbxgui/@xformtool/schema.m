function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdtbxgui');
    spk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'xformtool', spk.findclass('siggui'));
    % 13 14
    p = vertcat(schema.prop(c, 'Transform', 'string'), schema.prop(c, 'Labels', 'MATLAB array'), schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'isTransformed', 'bool'));
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
    p(2.0).FactoryValue = getlabels;
    % 22 23
    p = vertcat(schema.prop(c, 'SourceType', 'string'), schema.prop(c, 'TargetType', 'string'), schema.prop(c, 'SourceFrequency', 'string'), schema.prop(c, 'TargetFrequency', 'string vector'), schema.prop(c, 'Filter', 'MATLAB array'), schema.prop(c, 'CurrentFs', 'MATLAB array'));
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    p(1.0).FactoryValue = 'Lowpass';
    set(p(2.0), 'FactoryValue', 'Lowpass', 'AccessFlags.AbortSet', 'Off');
    p(3.0).FactoryValue = '.4';
    p(4.0).FactoryValue = {'.3','.6'};
    p(6.0).FactoryValue = defaultFs;
    % 37 38
    e = schema.event(c, 'FilterTransformed');
end % function
function Fs = defaultFs
    % 41 43
    % 42 43
    Fs.units = 'Normalized (0 to 1)';
    Fs.value = [];
end % function
function xforms = getlabels
    % 47 49
    % 48 49
    xforms.iirlp2lp = {'Specify desired frequency location:'};
    xforms.iirlp2hp = xforms.iirlp2lp;
    xforms.iirlp2bp = {'Specify desired low frequency location:','Specify desired high frequency location:'};
    % 52 53
    xforms.iirlp2bs = xforms.iirlp2bp;
    xforms.iirlp2mb = {'Specify a vector of desired frequency locations:'};
    xforms.iirlp2bpc = xforms.iirlp2bp;
    xforms.iirlp2bsc = xforms.iirlp2bs;
    xforms.iirlp2mbc = xforms.iirlp2mb;
    xforms.firlp2lp = {};
    xforms.firlp2hp = {};
end % function
