function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    parent = findclass(pk, 'basefilter');
    c = schema.class(pk, 'abstractfilter', parent);
    c.Description = 'abstract';
    % 12 14
    % 13 14
    findclass(pk, 'filterquantizer');
    p = schema.prop(c, 'privfq', 'dfilt.filterquantizer vector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @set_privfq;
    % 19 21
    % 20 21
    p = schema.prop(c, 'filterquantizer', 'dfilt.filterquantizer');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @set_filterquantizer;
    p.GetFunction = @get_filterquantizer;
    % 26 27
    p = schema.prop(c, 'privfilterquantizer', 'dfilt.filterquantizer');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 31 33
    % 32 33
    p = schema.prop(c, 'filterquantizerlisteners', 'handle.listener vector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 36 37
    p = schema.prop(c, 'FilterStructure', 'string');
    p.AccessFlags.PublicSet = 'Off';
    % 39 40
    p = schema.prop(c, 'privArithmetic', 'string');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_privarith;
    p.GetFunction = @get_privarith;
    % 46 47
    p = schema.prop(c, 'States', 'mxArray');
    p.GetFunction = @getstates;
    p.SetFunction = @setstates;
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    set(p, 'AccessFlags.AbortSet', 'Off');
    % 55 56
    p = schema.prop(c, 'HiddenStates', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Init = 'off';
    % 61 62
    p = schema.prop(c, 'TapIndex', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.SetFunction = @set_tapindex;
    p.FactoryValue = [];
    % 67 68
    p = schema.prop(c, 'ncoeffs', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.SetFunction = @check_length;
    % 72 73
    p = schema.prop(c, 'nchannels', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
end % function
function pa = get_privarith(this, pa)
    % 78 81
    % 79 81
    % 80 81
    if isempty(pa)
        pa = defaultarithmetic(this);
    end % if
end % function
function fd = get_privfdesign(this, privfdesign)
    % 86 88
    % 87 88
    if isempty(privfdesign)
        fd = [];
    else
        fd = copy(privfdesign);
    end % if
end % function
function fm = get_privfmethod(this, privfmethod)
    % 95 97
    % 96 97
    if isempty(privfmethod)
        fm = [];
    else
        fm = copy(privfmethod);
    end % if
end % function
function S = setstates(Hm, S)
    % 104 107
    % 105 107
    % 106 107
    S = ziscalarexpand(Hm, S);
    % 108 109
    thissetstates(Hm, S);
    % 110 111
    S = [];
end % function
function ncoeffs = check_length(Hm, ncoeffs)
    % 114 116
    % 115 116
    if gt(length(ncoeffs), 2.0)
        error('Internal error: the maximum length of the ncoeffs vector is 2.');
    end % if
end % function
