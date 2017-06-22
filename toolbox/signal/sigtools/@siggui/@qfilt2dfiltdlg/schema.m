function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'qfilt2dfiltdlg', pk.findclass('okcanceldlg'));
    % 10 11
    p = schema.prop(c, 'ActionToPerform', 'string');
    set(p, 'SetFunction', @setaction, 'GetFunction', @getaction);
    % 13 14
    p = schema.prop(c, 'Filter', 'mxArray');
    set(p, 'SetFunction', @setfilter);
end % function
function f = setfilter(this, f)
    % 18 20
    % 19 20
    if isa(f, 'qfilt')
        % 21 22
        w = warning('off');
        % 23 25
        % 24 25
        Hd = dfilt(f);
        % 26 27
        warning(w);
        % 28 29
        h = getcomponent(this, '-class', 'siggui.selectorwvalues');
        if isquantized(Hd)
            enableselection(h, 'fixed');
        else
            disableselection(h, 'fixed');
        end % if
    end % if
end % function
function a = setaction(this, a)
    % 38 40
    % 39 40
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 41 42
    if not(isempty(h))
        set(h, 'Selection', a);
    end % if
end % function
function a = getaction(this, a)
    % 47 49
    % 48 49
    h = getcomponent(this, '-class', 'siggui.selectorwvalues');
    % 50 51
    if not(isempty(h))
        a = get(h, 'Selection');
    end % if
end % function
