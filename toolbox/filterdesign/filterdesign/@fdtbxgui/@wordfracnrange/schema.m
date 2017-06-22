function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fdtbxgui');
    c = schema.class(pk, 'wordfracnrange', pk.findclass('wordnfrac'));
    % 9 11
    p = schema.prop(c, 'SpecifyWhich', 'string vector');
    set(p, 'SetFunction', @setspecifywhich, 'GetFunction', @getspecifywhich);
    % 12 14
    p = schema.prop(c, 'Ranges', 'string vector');
    set(p, 'GetFunction', @getranges, 'SetFunction', @setranges);
    % 15 17
    p = schema.prop(c, 'EnableFracLengths', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 18 20
    p = schema.prop(c, 'UMS_Listeners', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function sw = setspecifywhich(this, sw)
    % 23 26
    % 24 26
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 26 28
    if isempty(h)
        return;
    end % if
    for indx=1.0:length(sw)
        set(h(indx), 'Selection', sw{indx});
    end % for
    sw = {};
end % function
function sw = getspecifywhich(this, sw)
    % 36 39
    % 37 39
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 39 41
    if isempty(h)
        return;
    end % if
    for indx=1.0:this.Maximum
        sw{indx} = get(h(indx), 'Selection');
    end % for
end % function
function r = getranges(this, r)
    % 48 50
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 50 52
    if isempty(h)
        return;
    end % if
    for indx=1.0:this.Maximum
        r{indx} = get(h(indx), 'Values');
        r{indx} = r{indx}{2.0};
    end % for
end % function
function r = setranges(this, r)
    % 60 62
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 62 64
    if isempty(h)
        return;
    end % if
    for indx=1.0:min(this.Maximum, length(this.FracLabels))
        vals = get(h(indx), 'Values');
        vals{2.0} = r{indx};
        set(h(indx), 'Values', vals);
    end % for
    r = {};
end % function
