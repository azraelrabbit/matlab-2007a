function cleanRestore(h, mode, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    for i=length(h.ChangeRec):-1.0:1.0
        switch h.ChangeRec(i).Mode
        case 'parameter'
            paramName = h.ChangeRec(i).Key;
            dirtyBef = get_param(h.ModelHandle, 'Dirty');
            oldVal = h.ChangeRec(i).Setting;
            set_param(h.ModelHandle, paramName, oldVal);
            set_param(h.ModelHandle, 'Dirty', dirtyBef);
        case 'configset'
            % 19 20
            dirtyBef = get_param(h.ModelHandle, 'Dirty');
            newSet = h.ChangeRec(i).Key;
            oldSet = h.ChangeRec(i).Setting;
            setActiveConfigSet(h.ModelHandle, oldSet);
            detachConfigSet(h.ModelHandle, newSet);
            set_param(h.ModelHandle, 'Dirty', dirtyBef);
        otherwise
            % 27 28
            assertMsg = 'Internal error: unhandled clean restore in Real-Time Workshop build process';
            rtwassert(false, assertMsg);
        end % switch
    end % for
end % function
