function result = LogFileManager(h, method, str)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    result = '';
    if lt(nargin, 3.0)
        str = '';
    end % if
    switch lower(method)
    case 'create'
        h.LogFileName = fullfile(h.BuildDirectory, 'rtwbuildlog.txt');
        fp = fopen(h.LogFileName, 'w');
        fclose(fp);
    case 'add'
        if ge(nargin, 3.0)
            fp = fopen(h.LogFileName, 'a');
            fprintf(fp, '%s\n', str);
            fclose(fp);
        end % if
    case 'get'
        if isempty(h.LogFileName)
            result = '';
            return;
        end % if
        fp = fopen(h.LogFileName, 'rt');
        if le(fp, 2.0)
            result = '';
            return;
        end % if
        result = ctranspose(fread(fp, '*char'));
        fclose(fp);
    case 'flush'
        result = LogFileManager(h, 'get');
        if isempty(result)
            return;
        end % if
        logTxt = result;
        % 40 42
        nag = slsfnagctlr('NagTemplate');
        nag.type = 'Log';
        nag.msg.details = logTxt;
        nag.msg.type = 'Build';
        nag.msg.summary = '';
        nag.component = 'RTW Builder';
        nag.sourceName = h.ModelName;
        nag.ids = [];
        nag.blkHandles = [];
        % 50 52
        nag.refDir = h.BuildDirectory;
        % 52 54
        slsfnagctlr('Naglog', 'push', nag);
        slsfnagctlr('View');
    end % switch
