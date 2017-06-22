function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'freqspecswbw', pk.findclass('freqframe'));
    set(c, 'Description', 'Frequency Specifications');
    % 10 12
    p = schema.prop(c, 'Values', 'string vector');
    set(p, 'SetFunction', @setvalues, 'GetFunction', @getvalues);
    % 13 15
    p = schema.prop(c, 'Labels', 'string vector');
    set(p, 'SetFunction', @setlabels, 'GetFunction', @getlabels);
    % 16 18
    p = schema.prop(c, 'nonBWLabel', 'string');
    set(p, 'FactoryValue', 'Rolloff', 'SetFunction', @setnonbwlbl, 'GetFunction', @getnonbwlbl);
    % 19 21
    if isempty(findtype('sigguiBWvnonBW'))
        schema.EnumType('sigguiBWvnonBW', {'bandwidth','nonbw','none'});
    end % if
    % 23 25
    p = schema.prop(c, 'TransitionMode', 'sigguiBWvnonBW');
    set(p, 'SetFunction', @settmode, 'GetFunction', @gettmode);
    % 26 28
    p = schema.prop(c, 'Bandwidth', 'string');
    set(p, 'SetFunction', @setbandwidth, 'GetFunction', @getbandwidth);
    % 29 31
    p = schema.prop(c, 'nonBW', 'string');
    set(p, 'SetFunction', @setnonbw, 'GetFunction', @getnonbw);
end % function
function out = setlabels(this, out)
    % 34 37
    % 35 37
    set(getcomponent(this, '-class', 'siggui.labelsandvalues'), 'Labels', out);
    out = {''};
end % function
function out = getlabels(this, out)
    % 40 43
    % 41 43
    out = get(getcomponent(this, '-class', 'siggui.labelsandvalues'), 'Labels');
    if isempty(out)
        out = {''};
    end % if
end % function
function out = setvalues(this, out)
    set(getcomponent(this, '-class', 'siggui.labelsandvalues'), 'Values', out);
    out = {''};
end % function
function out = getvalues(this, out)
    % 52 55
    % 53 55
    out = get(getcomponent(this, '-class', 'siggui.labelsandvalues'), 'Values');
    if isempty(out)
        out = {''};
    end % if
end % function
function out = settmode(this, out)
    % 60 62
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    if strcmpi(out, 'none')
        disableselection(hs, 'bandwidth', 'nonbw');
    else
        enableselection(hs, 'bandwidth', 'nonbw');
        set(hs, 'selection', lower(out));
    end % if
end % function
function out = gettmode(this, out)
    % 70 73
    % 71 73
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    if not(isempty(hs))
        if isempty(getenabledselections(hs))
            out = 'none';
        else
            out = get(hs, 'selection');
            if isempty(out)
                out = 'none';
            end % if
        end % if
    end % if
end % function
function out = setnonbwlbl(this, out)
    setstring(getcomponent(this, '-class', 'siggui.selectorwvalues'), 'nonbw', out);
    out = '';
end % function
function out = getnonbwlbl(this, out)
    % 89 92
    % 90 92
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    if not(isempty(hs))
        out = getstring(hs, 'nonbw');
    end % if
end % function
function out = setbandwidth(this, out)
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 98 100
    vals = get(hs, 'Values');
    vals{1.0} = out;
    set(hs, 'Values', vals);
    % 102 104
    out = '';
end % function
function out = getbandwidth(this, out)
    % 106 109
    % 107 109
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    if not(isempty(hs))
        out = get(hs, 'Values');
        out = out{1.0};
    end % if
end % function
function out = setnonbw(this, out)
    % 115 118
    % 116 118
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 118 120
    vals = get(hs, 'Values');
    vals{2.0} = out;
    set(hs, 'Values', vals);
    % 122 124
    out = '';
end % function
function out = getnonbw(this, out)
    % 126 129
    % 127 129
    hs = getcomponent(this, '-class', 'siggui.selectorwvalues');
    if not(isempty(hs))
        out = get(hs, 'Values');
        out = out{2.0};
    end % if
end % function
