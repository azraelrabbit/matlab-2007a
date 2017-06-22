function varargout = exprofile_callback(action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    s.action = action;
    s.hSrc = varargin{1.0};
    s.hDlg = varargin{2.0};
    % 9 11
    switch action
    case 'callback'
        % 12 15
        % 13 15
        s.currentVar = varargin{3.0};
        s.currentVal = getVal(s, s.currentVar);
        feval(horzcat(s.currentVar, '_callback'), s);
    case 'opencallback'
        % 18 21
        % 19 21
        callbacks = {'ExecutionProfilingEnabled'};
        for k=1.0:length(callbacks)
            s.currentVar = callbacks{k};
            s.currentVal = getVal(s, s.currentVar);
            feval(horzcat(s.currentVar, '_callback'), s);
        end % for
    end
end
function ExecutionProfilingEnabled_callback(s)
    % 29 31
    switch s.currentVal
    case {'on'}
        setEnable(s, 'ExecutionProfilingNumSamples', 1.0);
    otherwise
        setEnable(s, 'ExecutionProfilingNumSamples', 0.0);
    end
end
function setEnable(s, propName, state)
    % 38 42
    % 39 42
    % 40 42
    if strcmp(state, 'on')
        state = 1.0;
    else
        if strcmp(state, 'off')
            state = 0.0;
        end
    end
    slConfigUISetEnabled(s.hDlg, s.hSrc, propName, state);
end
function val = getVal(s, propName)
    % 51 53
    val = slConfigUIGetVal(s.hDlg, s.hSrc, propName);
end
