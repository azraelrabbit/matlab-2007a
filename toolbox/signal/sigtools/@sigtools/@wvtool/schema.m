function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigtools');
    % 9 10
    spk = findpackage('siggui');
    c = schema.class(pk, 'wvtool', spk.findclass('sigcontainer'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Name', 'string');
    p.FactoryValue = 'Window Visualization Tool';
    % 16 18
    % 17 18
    schema.event(c, 'WVToolClosing');
    % 19 20
    p = schema.prop(c, 'Legend', 'on/off');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @setlegend, 'GetFunction', @getlegend);
end % function
function l = setlegend(this, l)
    % 24 27
    % 25 27
    % 26 27
    h = getcomponent(this, '-class', 'siggui.winviewer');
    set(h, 'Legend', l);
end % function
function l = getlegend(this, l)
    % 31 33
    % 32 33
    h = getcomponent(this, '-class', 'siggui.winviewer');
    l = get(h, 'Legend');
end % function
