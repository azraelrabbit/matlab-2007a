function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 10
    c = schema.class(pk, 'designpanel', pk.findclass('sigcontainer'));
    % 10 13
    % 11 13
    p = vertcat(schema.prop(c, 'Frames', 'siggui.siggui vector'), schema.prop(c, 'AvailableTypes', 'MATLAB array'), schema.prop(c, 'CurrentDesignMethod', 'handle'), schema.prop(c, 'UserModifiedListener', 'MATLAB array'), schema.prop(c, 'ActiveComponents', 'MATLAB array'), schema.prop(c, 'PreviousStateInfo', 'MATLAB array'), schema.prop(c, 'isLoading', 'bool'));
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p(2.0).FactoryValue = defaulttypes;
    p(3.0).AccessFlags.AbortSet = 'Off';
    % 23 25
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 25 28
    % 26 28
    schema.prop(c, 'isDesigned', 'bool');
    % 28 30
    p = schema.prop(c, 'ResponseType', 'string');
    set(p, 'SetFunction', @setfiltertype, 'GetFunction', @getfiltertype);
    % 31 33
    p = schema.prop(c, 'SubType', 'string');
    set(p, 'SetFunction', @setsubtype, 'GetFunction', @getsubtype);
    % 34 36
    p = schema.prop(c, 'DesignMethod', 'string');
    set(p, 'SetFunction', @setdesignmethod, 'GetFunction', @getdesignmethod);
    % 37 39
    p = schema.prop(c, 'CurrentFs', 'MATLAB array');
    set(p, 'GetFunction', @getcurrentfs);
    % 40 42
    p = schema.prop(c, 'ResponseTypeCSHTag', 'string');
    set(p, 'FactoryValue', 'fdatool_filter_type_frame');
    % 43 45
    schema.prop(c, 'StaticResponse', 'on/off');
    % 45 47
    schema.event(c, 'FilterDesigned');
end % function
function types = defaulttypes
    % 49 52
    % 50 52
    fir.name = '';
    fir.tag = '';
    fir = repmat(fir, 5.0, 1.0);
    fir(1.0).name = 'Equiripple';
    fir(1.0).tag = 'filtdes.remez';
    % 56 58
    fir(2.0).name = 'Least-squares';
    fir(2.0).tag = 'filtdes.firls';
    % 59 61
    fir(3.0).name = 'Window';
    fir(3.0).tag = 'filtdes.fir1';
    % 62 64
    fir(4.0).name = 'Constr. Least-squares';
    fir(4.0).tag = 'filtdes.fircls';
    % 65 67
    fir(5.0).name = 'Complex Equiripple';
    fir(5.0).tag = 'filtdes.cremez';
    % 68 70
    fir(6.0).name = 'Maximally flat';
    fir(6.0).tag = 'filtdes.firmaxflat';
    % 71 73
    iir.name = '';
    iir.tag = '';
    iir = repmat(iir, 5.0, 1.0);
    iir(1.0).name = 'Butterworth';
    iir(1.0).tag = 'filtdes.butter';
    % 77 79
    iir(2.0).name = 'Chebyshev Type I';
    iir(2.0).tag = 'filtdes.cheby1';
    % 80 82
    iir(3.0).name = 'Chebyshev Type II';
    iir(3.0).tag = 'filtdes.cheby2';
    % 83 85
    iir(4.0).name = 'Elliptic';
    iir(4.0).tag = 'filtdes.ellip';
    % 86 88
    iir(5.0).name = 'Maximally flat';
    iir(5.0).tag = 'filtdes.iirmaxflat';
    % 89 91
    types.lp(1.0).name = 'Lowpass';
    types.lp(1.0).tag = 'lp';
    types.lp(1.0).fir = fir;
    types.lp(1.0).iir = iir;
    % 94 96
    types.lp(2.0).name = 'Raised-cosine';
    types.lp(2.0).tag = 'rcos';
    types.lp(2.0).fir = fir(3.0);
    types.lp(2.0).iir = [];
    % 99 101
    types.hp(1.0).name = 'Highpass';
    types.hp(1.0).tag = 'hp';
    types.hp(1.0).fir = fir(1.0:5.0);
    types.hp(1.0).iir = iir(1.0:5.0);
    % 104 106
    types.bp(1.0).name = 'Bandpass';
    types.bp(1.0).tag = 'bp';
    types.bp(1.0).fir = fir(1.0:4.0);
    types.bp(1.0).iir = iir(1.0:4.0);
    % 109 111
    types.bs(1.0).name = 'Bandstop';
    types.bs(1.0).tag = 'bs';
    types.bs(1.0).fir = fir(1.0:4.0);
    types.bs(1.0).iir = iir(1.0:4.0);
    % 114 116
    types.other(1.0).name = 'Differentiator';
    types.other(1.0).tag = 'diff';
    types.other(1.0).fir = fir(1.0:2.0);
    types.other(1.0).iir = [];
    % 119 121
    types.other(2.0).name = 'Multiband';
    types.other(2.0).tag = 'multiband';
    types.other(2.0).fir = vertcat(fir(1.0:2.0), fir(4.0:5.0));
    types.other(2.0).iir = [];
    % 124 126
    types.other(3.0).name = 'Hilbert Transformer';
    types.other(3.0).tag = 'hilb';
    types.other(3.0).fir = fir(1.0:2.0);
    types.other(3.0).iir = [];
    % 129 131
    types.other(4.0).name = 'Arbitrary Magnitude';
    types.other(4.0).tag = 'arbitrarymag';
    types.other(4.0).fir = fir(1.0:2.0);
    types.other(4.0).iir = [];
end % function
function out = setfiltertype(h, type)
    % 136 140
    % 137 140
    % 138 140
    out = getnset(h, 'setresponsetype', type);
end % function
function out = getfiltertype(h, type)
    % 142 145
    % 143 145
    out = getnset(h, 'getresponsetype', type);
end % function
function out = setdesignmethod(h, type)
    % 147 150
    % 148 150
    out = getnset(h, 'setdesignmethod', type);
end % function
function out = getdesignmethod(h, type)
    % 152 155
    % 153 155
    out = getnset(h, 'getdesignmethod', type);
end % function
function out = getcurrentfs(h, type)
    % 157 160
    % 158 160
    out = getnset(h, 'getcfs', type);
end % function
function out = getsubtype(h, type)
    % 162 165
    % 163 165
    out = getnset(h, 'getsubtype', type);
end % function
function out = setsubtype(h, type)
    % 167 170
    % 168 170
    out = getnset(h, 'setsubtype', type);
end % function
