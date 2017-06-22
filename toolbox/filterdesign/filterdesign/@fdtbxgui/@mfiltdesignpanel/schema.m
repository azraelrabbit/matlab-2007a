function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fdtbxgui');
    c = schema.class(pk, 'mfiltdesignpanel', findclass(findpackage('siggui'), 'sigcontainer'));
    % 9 11
    if isempty(findtype('mfiltTypes'))
        schema.EnumType('mfiltTypes', {'Interpolator','Decimator','Fractional-rate converter'});
    end % if
    % 13 15
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    set(p, 'FactoryValue', 2.0, 'SetFunction', @setinterpolationfactor, 'GetFunction', @getinterpolationfactor);
    % 16 19
    % 17 19
    p = schema.prop(c, 'DecimationFactor', 'posint');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @setdecimationfactor, 'GetFunction', @getdecimationfactor);
    % 20 23
    % 21 23
    p = schema.prop(c, 'FrequencyUnits', 'signalFrequencyUnits');
    set(p, 'SetFunction', @setfrequencyunits, 'GetFunction', @getfrequencyunits);
    % 24 26
    p = schema.prop(c, 'Fs', 'string');
    set(p, 'SetFunction', @setfs, 'GetFunction', @getfs);
    % 27 29
    p = schema.prop(c, 'Type', 'mfiltTypes');
    set(p, 'SetFunction', @settype, 'GetFunction', @gettype);
    % 30 32
    findclass(findpackage('dfilt'), 'basefilter');
    p = schema.prop(c, 'CurrentFilter', 'dfilt.basefilter');
    set(p, 'SetFunction', @set_currentfilter);
    % 34 36
    p = schema.prop(c, 'Implementation', 'string');
    set(p, 'SetFunction', @setimplementation, 'GetFunction', @getimplementation);
    % 37 39
    p = schema.prop(c, 'DifferentialDelay', 'string');
    set(p, 'FactoryValue', '1');
    % 40 42
    p = schema.prop(c, 'NumberOfSections', 'string');
    set(p, 'FactoryValue', '2');
    % 43 45
    p = schema.prop(c, 'isDesigned', 'bool');
    set(p, 'FactoryValue', false);
    % 46 49
    % 47 49
    p = vertcat(schema.prop(c, 'privType', 'mxArray'), schema.prop(c, 'interpInterpolationFactor', 'mxArray'), schema.prop(c, 'decimDecimationFactor', 'mxArray'), schema.prop(c, 'srcInterpolationFactor', 'mxArray'), schema.prop(c, 'srcDecimationFactor', 'mxArray'));
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 56 59
    % 57 59
    p = schema.prop(c, 'JavaHandles', 'mxArray');
    set(p, 'Visible', 'Off');
    % 60 62
    schema.event(c, 'FilterDesigned');
end % function
function cf = set_currentfilter(this, cf)
    % 64 67
    % 65 67
    hs = getcomponent(this, 'tag', 'implementation');
    % 67 69
    if not(isempty(hs))
        if isa(cf, 'dfilt.dtffir') || isa(cf, 'mfilt.abstractfirmultirate')
            enableselection(hs, 'current');
        else
            disableselection(hs, 'current');
        end % if
    end % if
end % function
function frequ = setfrequencyunits(this, frequ)
    % 77 80
    % 78 80
    hfs = getcomponent(this, 'fs');
    % 80 82
    if not(isempty(hfs))
        set(hfs, 'Units', frequ);
    end % if
    % 84 86
    set(this, 'isDesigned', false);
end % function
function frequ = getfrequencyunits(this, frequ)
    % 88 91
    % 89 91
    hfs = getcomponent(this, 'fs');
    % 91 93
    if not(isempty(hfs))
        frequ = get(hfs, 'Units');
    end % if
end % function
function fs = setfs(this, fs)
    % 97 100
    % 98 100
    hfs = getcomponent(this, 'fs');
    % 100 102
    if not(isempty(hfs))
        set(hfs, 'Value', fs);
    end % if
    % 104 106
    set(this, 'isDesigned', false);
end % function
function fs = getfs(this, fs)
    % 108 111
    % 109 111
    hfs = getcomponent(this, 'fs');
    % 111 113
    if not(isempty(hfs))
        fs = get(hfs, 'Value');
    end % if
end % function
function imp = setimplementation(this, imp)
    % 117 120
    % 118 120
    hs = getcomponent(this, 'tag', 'implementation');
    % 120 122
    if isempty(hs)
        return;
    end % if
    set(hs, 'Selection', imp);
end % function
function imp = getimplementation(this, imp)
    % 127 129
    hs = getcomponent(this, 'tag', 'implementation');
    % 129 131
    if isempty(hs)
        return;
    end % if
    imp = get(hs, 'Selection');
end % function
