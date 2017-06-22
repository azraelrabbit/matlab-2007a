function [retVal, idx] = unique(string_cell, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    retVal = [];
    % 12 14
    % 13 14
    remove_trailing_filesep = false;
    ignore_case = false;
    % 16 18
    % 17 18
    if gt(nargin, 1.0)
        for i=1.0:length(varargin)
            switch varargin{i}
            case 'removetrailingfilesep'
                remove_trailing_filesep = true;
            case 'ignorecase'
                ignore_case = true;
            otherwise
                DAStudio.error('RTW:utility:invalidInputArgs', varargin{i});
            end % switch
        end % for
    end % if
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    revList = string_cell(end:-1.0:1.0);
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    if eq(remove_trailing_filesep, true)
        revList = regexprep(revList, '(.*?)[\\/]?$', '$1');
    end % if
    % 46 49
    % 47 49
    % 48 49
    if ignore_case
        tmp = lower(revList);
        [tmp, idx] = unique(tmp);
    else
        [tmp, idx] = unique(revList);
    end % if
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    idx = sort(idx, 'descend');
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    retVal = revList(idx);
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    idx = plus(minus(length(string_cell), idx), 1.0);
end % function
