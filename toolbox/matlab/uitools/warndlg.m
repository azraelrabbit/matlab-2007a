function varargout = warndlg(WarnString, DlgName, Replace)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    if eq(nargin, 0.0)
        WarnString = 'This is the default warning string.';
    end % if
    if lt(nargin, 2.0)
        DlgName = 'Warning Dialog';
    end % if
    if lt(nargin, 3.0)
        Replace = 'non-modal';
    end % if
    % 37 39
    if ischar(WarnString) && not(iscellstr(WarnString))
        WarnString = cellstr(WarnString);
    end % if
    if not(iscellstr(WarnString))
        error('MATLAB:warndlg:InvalidWarnStringInput', 'WarnString should be a string or cell array of strings');
    end % if
    % 44 46
    WarnStringCell = cell(1.0, length(WarnString));
    for i=1.0:length(WarnString)
        WarnStringCell{i} = xlate(WarnString{i});
    end % for
    % 49 51
    handle = msgbox(WarnStringCell, DlgName, 'warn', Replace);
    % 51 53
    if eq(nargout, 1.0)
        varargout(1.0) = cellhorzcat(handle);
    end % if
end % function
