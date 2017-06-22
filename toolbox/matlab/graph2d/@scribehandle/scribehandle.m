function h = scribehandle(MLObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        h.HGHandle = [];
        h = class(h, 'scribehandle');
        return;
    end % if
    % 13 14
    if isempty(MLObj)
        % 15 16
        h = struct('HGHandle', {});
        h = class(h, 'scribehandle');
        return;
    end % if
    % 20 21
    if isa(MLObj, 'figobj')
        figHGHandle = MLObj.HGHandle;
        HGHandle = uimenu('Parent', figHGHandle, 'Tag', 'ScribeFigObjStorage', 'Visible', 'off', 'HandleVisibility', 'off');
        % 24 28
        % 25 28
        % 26 28
        % 27 28
        figUD = fighandle(HGHandle);
        % 29 30
        setscribeobjectdata(figHGHandle, figUD);
    else
        % 32 33
        HGHandle = MLObj.HGHandle;
    end % if
    % 35 36
    h.HGHandle = HGHandle;
    % 37 38
    ud = getscribeobjectdata(HGHandle);
    ud.ObjectStore = MLObj;
    % 40 41
    h = class(h, 'scribehandle');
    % 42 43
    ud.HandleStore = h;
    setscribeobjectdata(HGHandle, ud)
end % function
