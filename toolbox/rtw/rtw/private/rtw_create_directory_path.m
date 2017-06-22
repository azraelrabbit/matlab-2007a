function fullDirName = rtw_create_directory_path(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fileSepChar = filesep;
    % 8 9
    if lt(nargin, 2.0)
        DAStudio.error('RTW:utility:invalidArgCount', 'rtw_create_directory_path', 'at least two');
        % 11 12
    end % if
    % 13 14
    parentDirName = varargin{1.0};
    if eq(parentDirName(end), fileSepChar)
        parentDirName = parentDirName(1.0:minus(end, 1.0));
    end % if
    % 18 19
    for i=2.0:nargin
        parentDirName = horzcat(parentDirName, fileSepChar);
        childDirName = varargin{i};
        fullDirName = horzcat(parentDirName, childDirName);
        if not(exist(fullDirName, 'dir'))
            [success, errorMessage] = rtw_mk_dir(parentDirName, childDirName);
            if not(success)
                DAStudio.error('RTW:utility:mkdirError', fullDirName, errorMessage);
            end % if
        end % if
        parentDirName = fullDirName;
    end % for
end % function
