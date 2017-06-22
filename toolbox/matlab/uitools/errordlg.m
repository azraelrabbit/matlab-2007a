function varargout = errordlg(ErrorStringIn, DlgName, Replace)
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
    NumArgIn = nargin;
    if eq(NumArgIn, 0.0)
        ErrorStringIn = {'This is the default error string.'};
    end
    % 32 34
    if lt(NumArgIn, 2.0)
        DlgName = 'Error Dialog';
    end
    if lt(NumArgIn, 3.0)
        Replace = 'non-modal';
    end
    if ischar(Replace)
        if strcmp(Replace, 'on')
            Replace = 'replace';
        else
            if strcmp(Replace, 'off')
                Replace = 'non-modal';
            end
        end
    end
    if ischar(ErrorStringIn) && not(iscellstr(ErrorStringIn))
        ErrorString = cellstr(ErrorStringIn);
    else
        ErrorString = ErrorStringIn;
    end
    if not(iscellstr(ErrorString))
        error('MATLAB:errordlg:InvalidInput', 'Errorstring should be a string or cell array of strings');
    end
    ErrorStringCell = cell(1.0, length(ErrorString));
    for i=1.0:length(ErrorString)
        ErrorStringCell{i} = xlate(ErrorString{i});
    end % for
    handle = msgbox(ErrorStringCell, DlgName, 'error', Replace);
    if eq(nargout, 1.0)
        varargout(1.0) = cellhorzcat(handle);
    end
end
