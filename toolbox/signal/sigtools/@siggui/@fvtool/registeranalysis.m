function [hmenu, htoolbar] = registeranalysis(hFVT, lbl, tag, fcn, icon, accel, checkfcn)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    error(nargchk(4.0, 7.0, nargin));
    % 13 15
    if lt(nargin, 5.0)
        icon = [];
    end
    if lt(nargin, 6.0)
        accel = '';
    end
    if lt(nargin, 7.0)
        checkfcn = [];
    end
    info = get(hFVT, 'AnalysesInfo');
    if ~(isempty(info)) && isfield(info, tag)
        error(horzcat('The tag ''', tag, ''' is already in use.'));
    end
    info.(tag) = lclbuildstruct(lbl, fcn, icon, accel, checkfcn);
    set(hFVT, 'AnalysesInfo', info);
    % 29 32
    % 30 32
    eventData = sigdatatypes.sigeventdata(hFVT, 'NewAnalysis', tag);
    send(hFVT, 'NewAnalysis', eventData);
    % 33 36
    % 34 36
    if isrendered(hFVT)
        h = get(hFVT, 'Handles');
        if isfield(h.menu.analyses, tag)
            hmenu = h.menu.analyses.(tag);
        else
            hmenu = [];
        end
        if isfield(h.toolbar.analyses, tag)
            htoolbar = h.toolbar.analyses.(tag);
        else
            hmenu = [];
        end
    else
        hmenu = [];
        htoolbar = [];
    end
end
function s = lclbuildstruct(lbl, fcn, icon, accel, checkfcn)
    % 53 56
    % 54 56
    s.label = lbl;
    s.fcn = fcn;
    s.icon = icon;
    s.accel = accel;
    s.check = checkfcn;
end
