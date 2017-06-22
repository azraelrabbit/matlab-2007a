function cleanChange(h, mode, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch mode
    case 'parameter'
        paramName = varargin{1.0};
        paramVal = varargin{2.0};
        dirtyBef = get_param(h.ModelHandle, 'Dirty');
        oldVal = get_param(h.ModelHandle, paramName);
        h.ChangeRec(plus(end, 1.0)).Mode = mode;
        h.ChangeRec(end).Key = paramName;
        h.ChangeRec(end).Setting = oldVal;
        set_param(h.ModelHandle, paramName, paramVal);
        set_param(h.ModelHandle, 'Dirty', dirtyBef);
    case 'configset'
        currentSet = getActiveConfigSet(h.ModelHandle);
        newset = varargin{1.0};
        dirtyBef = get_param(h.ModelHandle, 'Dirty');
        h.ChangeRec(plus(end, 1.0)).Mode = mode;
        h.ChangeRec(end).Key = newset.Name;
        h.ChangeRec(end).Setting = currentSet.Name;
        attachConfigSet(h.ModelHandle, newset);
        setActiveConfigSet(h.ModelHandle, newset.Name);
        set_param(h.ModelHandle, 'Dirty', dirtyBef);
    otherwise
        assertMsg = 'Internal error: unhandled clean change in Real-Time Workshop build process';
        rtwassert(false, assertMsg);
    end % switch
end % function
