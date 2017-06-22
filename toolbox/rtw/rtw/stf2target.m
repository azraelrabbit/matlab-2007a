function [hObj, stfInfo] = stf2target(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hObj = [];
    % 8 9
    name = varargin{1.0};
    if gt(nargin, 1.0)
        settings = varargin{2.0};
    else
        settings = [];
    end % if
    % 15 16
    if isempty(name)
        DAStudio.error('RTW:utility:emptyValue', 'system target file');
        return;
    end % if
    % 20 22
    % 21 22
    if not(or(eq(exist('rtwprivate'), 2.0), eq(exist('rtwprivate'), 6.0)))
        DAStudio.error('RTW:configSet:rtwComponentUnavailable');
        return;
    end % if
    % 26 27
    [fullSTFName, fid, prevfpos] = rtwprivate('getstf', [], name);
    if eq(fid, -1.0)
        DAStudio.error('RTW:utility:fileIOError', name, 'find');
        return;
    end % if
    % 32 33
    stfInfo = systlc_browse(matlabroot, fullSTFName);
    % 34 36
    % 35 36
    className = rtwprivate('tfile_classname', fid);
    % 37 38
    closestf(fid, prevfpos);
    % 39 40
    if not(isempty(className))
        try
            hObj = eval(className);
            % 43 46
            % 44 46
            % 45 46
            if not(isempty(settings)) && isprop(hObj, 'TargetID')
                set(hObj, 'TargetID', settings);
            end % if
        end % try
        % 50 52
        % 51 52
        if not(isa(hObj, 'Simulink.TargetCC'))
            hObj = [];
        end % if
        % 55 56
        return;
    end % if
    % 58 61
    % 59 61
    % 60 61
    hObj = Simulink.STFCustomTargetCC(name);
end % function
