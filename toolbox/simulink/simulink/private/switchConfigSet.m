function varargout = switchConfigSet(action, mdl, varargin)
    % 1 5
    % 2 5
    % 3 5
    varargout = {};
    % 5 7
    switch action
    case 'ReplaceConfigSetRef'
        % 8 10
        slassert(eq(nargout, 1.0));
        slassert(eq(nargin, 3.0));
        origCS = varargin{1.0};
        newCS = origCS;
        % 13 15
        slassert(eq(origCS, getActiveConfigSet(mdl)));
        % 15 17
        if isa(origCS, 'Simulink.ConfigSetRef')
            dirtyFlag = get_param(mdl, 'Dirty');
            % 18 25
            % 19 25
            % 20 25
            % 21 25
            % 22 25
            % 23 25
            if strcmp(origCS.SourceResolved, 'off')
                DAStudio.error('Simulink:utility:ConfigSetRefSourceObjectUnresolved', origCS.WSVarName, origCS.Name);
            else
                if strcmp(origCS.UpToDate, 'off')
                    % 28 30
                    origCS.refresh;
                    DAStudio.error('Simulink:utility:ConfigSetRefSourceObjectOutOfDate', origCS.Name, origCS.WSVarName);
                    % 31 33
                end
            end
            varName = get_param(origCS, 'WSVarName');
            set_param(mdl, 'OriginalConfigSetRefVarName', varName);
            newCS = origCS.getRefConfigSet.copy;
            attachConfigSet(mdl, newCS, true);
            newCS.activate;
            origCS.lock;
            set_param(mdl, 'Dirty', dirtyFlag);
        end
        varargout{1.0} = newCS;
    case 'RestoreOrigConfigSet'
        % 44 47
        % 45 47
        slassert(eq(nargout, 0.0));
        slassert(eq(nargin, 4.0));
        origCS = varargin{1.0};
        newCS = varargin{2.0};
        % 50 52
        slassert(eq(newCS, getActiveConfigSet(mdl)));
        % 52 54
        if ne(origCS, newCS)
            dirtyFlag = get_param(mdl, 'Dirty');
            origCS.unlock;
            set_param(mdl, 'OriginalConfigSetRefVarName', '');
            origCS.activate;
            detachConfigSet(mdl, newCS.Name);
            set_param(mdl, 'Dirty', dirtyFlag);
        end
        % 61 63
    end
end
