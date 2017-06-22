function updateFileSeparator(h, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(nargin, 1.0)
        if not(ismember(varargin{1.0}, {'/','\'}))
            DAStudio.error('RTW:buildInfo:badFileSep');
        end % if
        % 13 17
        % 14 17
        % 15 17
        if not(strcmp(varargin{1.0}, h.Settings.FileSep))
            h.Settings.FileSep = varargin{1.0};
        end % if
    end % if
    % 20 24
    % 21 24
    % 22 24
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end % if
    % 28 32
    % 29 32
    % 30 32
    h.Settings.Matlabroot = regexprep(h.Settings.Matlabroot, '[\\/]', regexp_filesep);
    % 32 36
    % 33 36
    % 34 36
    h.TargetPrecompLibLoc = regexprep(h.TargetPrecompLibLoc, '[\\/]', regexp_filesep);
    % 36 38
    h.InstallDirMexopts = regexprep(h.InstallDirMexopts, '[\\/]', regexp_filesep);
    % 38 42
    % 39 42
    % 40 42
    locUpdateKeyValPairFileSep(h, 'BuildArgs');
    locUpdateKeyValPairFileSep(h, 'TMFTokens');
    % 43 46
    % 44 46
    h.Src.updateFileSeparator();
    h.Inc.updateFileSeparator();
    % 47 50
    % 48 50
    for i=1.0:length(h.LinkObj)
        h.LinkObj(i).updateFileSeparator();
    end % for
end % function
function locUpdateKeyValPairFileSep(h, type)
    % 54 66
    % 55 66
    % 56 66
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    switch type
    case 'BuildArgs'
        kvVec = h.BuildArgs;
    case 'TMFTokens'
        kvVec = h.Tokens;
    otherwise
        % 71 74
        % 72 74
        DAStudio.error('RTW:utility:invalidInputArgs', 'locUpdateBuildArgFileSep');
        % 74 76
    end % switch
    % 76 80
    % 77 80
    % 78 80
    grps = get(kvVec, 'Group');
    if isempty(grps)
        grps = {};
    end % if
    if not(iscell(grps))
        grps = cellhorzcat(grps);
    end % if
    % 86 89
    % 87 89
    idx = not(cellfun(@isempty, regexp(grps, '.*_PATH$')));
    if not(any(idx))
        return;
    end % if
    % 92 94
    vals = get(kvVec, 'Value');
    if isempty(vals)
        vals = {};
    end % if
    if not(iscell(vals))
        vals = cellhorzcat(vals);
    end % if
    % 100 104
    % 101 104
    % 102 104
    if strcmp(h.Settings.FileSep, '\')
        regexp_filesep = '\\';
    else
        regexp_filesep = h.Settings.FileSep;
    end % if
    % 108 110
    vals(idx) = regexprep(vals(idx), '[\\/]', regexp_filesep);
    set(kvVec, {'Value'}, vals);
end % function
