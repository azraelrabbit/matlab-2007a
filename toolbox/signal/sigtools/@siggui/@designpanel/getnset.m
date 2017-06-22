function out = getnset(h, op, value)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    out = feval(op, h, value);
end % function
function out = getcfs(h, type)
    % 10 13
    % 11 13
    hDM = get(h, 'CurrentDesignMethod');
    % 13 15
    out.value = [];
    out.units = 'Normalized (0 to 1)';
    % 16 18
    if not(isempty(hDM))
        out.units = get(hDM, 'freqUnits');
        if not(strncmpi(out.units, 'normalized', 10.0))
            out.value = get(hDM, 'Fs');
        end % if
    end % if
end % function
function out = setresponsetype(h, type)
    % 25 29
    % 26 29
    % 27 29
    hFT = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Response Type');
    % 29 31
    set(hFT, 'Selection', type);
    % 31 33
    out = '';
end % function
function out = getresponsetype(h, type)
    % 35 39
    % 36 39
    % 37 39
    hFT = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Response Type');
    % 39 41
    out = get(hFT, 'Selection');
end % function
function out = setsubtype(h, type)
    % 43 46
    % 44 46
    hFT = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Response Type');
    % 46 48
    set(hFT, 'SubSelection', type);
    out = '';
end % function
function out = getsubtype(h, type)
    % 51 54
    % 52 54
    hFT = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Response Type');
    % 54 56
    out = get(hFT, 'SubSelection');
    if isempty(out)
        out = get(hFT, 'Selection');
    end % if
end % function
function out = setdesignmethod(h, type)
    % 61 65
    % 62 65
    % 63 65
    hDM = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Design Method');
    % 65 67
    iirms = getsubselections(hDM, 'iir');
    firms = getsubselections(hDM, 'fir');
    % 68 70
    if any(strcmpi(type, iirms))
        set(hDM, 'selection', 'iir');
        set(hDM, 'subselection', type);
    else
        if any(strcmpi(type, firms))
            set(hDM, 'selection', 'fir');
            set(hDM, 'subselection', type);
        else
            error('That method is not available.');
        end % if
    end % if
    out = '';
end % function
function out = getdesignmethod(h, type)
    % 83 86
    % 84 86
    hDM = getcomponent(h, '-class', 'siggui.selector', 'Name', 'Design Method');
    % 86 88
    if not(isempty(hDM))
        out = get(hDM, 'SubSelection');
    else
        out = '';
    end % if
end % function
