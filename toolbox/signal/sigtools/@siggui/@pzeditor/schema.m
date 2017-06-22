function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'pzeditor', pk.findclass('abstractmousefcns'));
    % 11 12
    if isempty(findtype('sigguiPZEditorActions'))
        schema.EnumType('sigguiPZEditorActions', {'Move Pole/Zero','Add Pole','Add Zero','Delete Pole/Zero'});
        % 14 15
    end % if
    % 16 17
    if isempty(findtype('sigguiPZEditorCoordinates'))
        schema.EnumType('sigguiPZEditorCoordinates', {'Polar','Rectangular'});
        % 19 20
    end % if
    % 21 23
    % 22 23
    p = vertcat(schema.prop(c, 'Action', 'sigguiPZEditorActions'), schema.prop(c, 'Filter', 'MATLAB array'), schema.prop(c, 'Gain', 'double_vector'), schema.prop(c, 'Poles', 'double_vector'), schema.prop(c, 'Zeros', 'double_vector'), schema.prop(c, 'CoordinateMode', 'sigguiPZEditorCoordinates'), schema.prop(c, 'ConjugateMode', 'on/off'), schema.prop(c, 'CurrentSection', 'double'));
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    set(p(2.0), 'SetFunction', @setfilter);
    set(p(2.0), 'GetFunction', @getfilter);
    set(p(3.0), 'SetFunction', @setgain);
    set(p(3.0), 'GetFunction', @getgain);
    set(p(4.0), 'SetFunction', @setpoles);
    set(p(4.0), 'GetFunction', @getpoles);
    set(p(5.0), 'SetFunction', @setzeros);
    set(p(5.0), 'GetFunction', @getzeros);
    set(p(7.0), 'SetFunction', @setconjugatemode);
    set(p(8.0), 'SetFunction', @setcurrentsection, 'FactoryValue', 1.0);
    % 45 48
    % 46 48
    % 47 48
    p = vertcat(schema.prop(c, 'Roots', 'MATLAB array'), schema.prop(c, 'AllRoots', 'MATLAB array'), schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'PZValueListener', 'handle'), schema.prop(c, 'CurrentRoots', 'handle vector'), schema.prop(c, 'privFilter', 'MATLAB array'));
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    set(p(1.0), 'GetFunction', @getroots, 'SetFunction', @setroots);
    set(p(2.0), 'SetFunction', @setallroots);
    % 59 61
    % 60 61
    schema.event(c, 'NewFilter');
end % function
function csec = setcurrentsection(hObj, csec)
    % 64 66
    % 65 66
    csec = getnset(hObj, 'setcurrentsection', csec);
end % function
function cmode = setconjugatemode(hObj, cmode)
    % 69 71
    % 70 71
    cmode = getnset(hObj, 'setconjugatemode', cmode);
end % function
function roots = getroots(hObj, roots)
    % 74 76
    % 75 76
    roots = getnset(hObj, 'getroots');
end % function
function roots = setroots(hObj, roots)
    % 79 81
    % 80 81
    roots = getnset(hObj, 'setroots', roots);
end % function
function gain = setgain(hObj, roots)
    % 84 86
    % 85 86
    gain = getnset(hObj, 'setgain', roots);
end % function
function gain = getgain(hObj, roots)
    % 89 91
    % 90 91
    gain = getnset(hObj, 'getgain');
end % function
function roots = setallroots(hObj, roots)
    % 94 96
    % 95 96
    roots = getnset(hObj, 'setallroots', roots);
end % function
function poles = getpoles(hObj, poles)
    % 99 101
    % 100 101
    poles = getnset(hObj, 'getpoles');
end % function
function zeros = getzeros(hObj, zeros)
    % 104 106
    % 105 106
    zeros = getnset(hObj, 'getzeros');
end % function
function poles = setpoles(hObj, poles)
    % 109 111
    % 110 111
    poles = getnset(hObj, 'setpoles', poles);
end % function
function zeros = setzeros(hObj, zeros)
    % 114 116
    % 115 116
    zeros = getnset(hObj, 'setzeros', zeros);
end % function
function filter = getfilter(hObj, filter)
    % 119 121
    % 120 121
    filter = getnset(hObj, 'getfilter');
end % function
function filter = setfilter(hObj, filter)
    % 124 126
    % 125 126
    filter = hObj.getnset('setfilter', filter);
end % function
