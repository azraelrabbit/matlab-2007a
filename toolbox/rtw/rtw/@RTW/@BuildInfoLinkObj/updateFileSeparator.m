function updateFileSeparator(h, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if gt(nargin, 1.0)
        if not(ismember(varargin{1.0}, {'/','\'}))
            DAStudio.error('RTW:buildInfo:badFileSep');
        end % if
        % 14 15
        if not(strcmp(varargin{1.0}, h.Settings.FileSep))
            h.Settings.FileSep = varargin{1.0};
        end % if
    end % if
    % 19 22
    % 20 22
    % 21 22
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end % if
    h.Settings.Matlabroot = regexprep(h.Settings.Matlabroot, '[\\/]', regexp_filesep);
    % 28 29
    h.Path = regexprep(h.Path, '[\\/]', regexp_filesep);
    % 30 32
    % 31 32
    h.Src.updateFileSeparator();
    h.Inc.updateFileSeparator();
end % function
