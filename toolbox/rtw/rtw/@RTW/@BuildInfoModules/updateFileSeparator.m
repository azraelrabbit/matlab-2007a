function updateFileSeparator(h, varargin)
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
    if gt(nargin, 1.0)
        if not(ismember(varargin{1.0}, {'/','\'}))
            DAStudio.error('RTW:buildInfo:badFileSep');
        end % if
        % 15 18
        % 16 18
        % 17 18
        if not(strcmp(varargin{1.0}, h.Settings.FileSep))
            h.Settings.FileSep = varargin{1.0};
        end % if
    end % if
    % 22 25
    % 23 25
    % 24 25
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end % if
    % 30 32
    % 31 32
    fpaths = get(h.Files, 'Path');
    if not(isempty(fpaths))
        if not(iscell(fpaths))
            fpaths = cellhorzcat(fpaths);
        end % if
        % 37 38
        fpaths = regexprep(fpaths, '[\\/]', regexp_filesep);
        set(h.Files, {'Path'}, fpaths);
    end % if
    % 41 43
    % 42 43
    spaths = get(h.Paths, 'Value');
    if not(isempty(spaths))
        if not(iscell(spaths))
            spaths = cellhorzcat(spaths);
        end % if
        % 48 49
        spaths = regexprep(spaths, '[\\/]', regexp_filesep);
        set(h.Paths, {'Value'}, spaths);
    end % if
end % function
