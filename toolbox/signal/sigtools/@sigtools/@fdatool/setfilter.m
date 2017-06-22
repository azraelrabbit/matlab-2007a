function setfilter(this, filt, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    error(nargchk(2.0, 3.0, nargin));
    error(validate_inputs(filt));
    % 25 28
    % 26 28
    [options, msg] = parse_optional_inputs(this, varargin{:});
    error(msg);
    % 29 31
    if options.filedirty
        sendfiledirty(this);
    else
        set(this, 'FileDirty', false);
    end % if
    % 35 38
    % 36 38
    if not(isempty(options.source))
        set(this, 'filterMadeBy', options.source);
    end % if
    % 40 42
    savemcode(this, options);
    % 42 45
    % 43 45
    if not(strcmp(class(filt), 'dfilt.dfiltwfs'))
        filt = dfilt.dfiltwfs(filt, options.fs, options.name);
    end % if
    this.Filter = filt;
    % 48 51
    % 49 51
    if options.update
        if options.fastupdate
            send(this, 'FastFilterUpdated', handle.EventData(this, 'FastFilterUpdated'));
        else
            send(this, 'FilterUpdated', handle.EventData(this, 'FilterUpdated'));
        end % if
        if not(strcmpi(get(this.figurehandle, 'tag'), 'initializing')) && options.default
            send(this, 'DefaultAnalysis', handle.EventData(this, 'DefaultAnalysis'));
        end % if
    end % if
end % function
function savemcode(this, options)
    % 62 66
    % 63 66
    % 64 66
    if isfield(options, 'mcode') && not(isempty(options.mcode))
        if isempty(this.MCode)
            this.MCode = sigcodegen.mcodebuffer;
        end % if
        if isequal(this.MCode, options.mcode)
            return;
        end % if
        if options.resetmcode
            this.MCode.clear;
        end % if
        if not(iscell(options.mcode))
            options.mcode = cellhorzcat(options.mcode);
        end % if
        this.MCode.cr;
        this.MCode.add(options.mcode);
    else
        if isfield(options, 'mcode') && isequal(this.MCode, options.mcode)
            return;
        end % if
        if isempty(this.MCode)
            if isempty(ishandle(this.MCode))
                this.MCode = sigcodegen.mcodebuffer;
            end % if
        else
            this.MCode.clear;
        end % if
    end % if
end % function
function [defaultopts, msg] = parse_optional_inputs(h, options)
    % 94 98
    % 95 98
    % 96 98
    oldfilt = get(h, 'Filter');
    if isempty(oldfilt)
        fs = [];
        name = '';
    else
        fs = get(oldfilt, 'fs');
        name = get(oldfilt, 'name');
    end % if
    % 105 107
    defaultopts = struct('update', true, 'default', true, 'source', '', 'fastupdate', false, 'resetmcode', false, 'name', name, 'fs', fs, 'filedirty', 1.0);
    % 107 116
    % 108 116
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    msg = '';
    if gt(nargin, 1.0)
        if not(isstruct(options))
            msg = 'Optional inputs must be a structure and/or a filter object.';
        else
            defaultopts = setstructfields(defaultopts, options);
        end % if
    end % if
end % function
function msg = validate_inputs(filt)
    % 125 129
    % 126 129
    % 127 129
    msg = [];
    % 129 131
    if not(isa(filt, 'dfilt.basefilter')) && not(isa(filt, 'dfilt.dfiltwfs'))
        msg = 'Second input must be a filter object';
    end % if
    % 133 135
    if isa(filt, 'adaptfilt.baseclass')
        msg = 'FDATool does not support importing Adaptive filters.   Use FVTool to analyze the filter.';
        % 136 138
    end % if
    % 138 140
    if isa(filt, 'dfilt.statespace')
        msg = 'FDATool does not support importing State-Space filters.  Use FVTool to analyze the filter.';
        % 141 143
    end % if
    % 143 145
    if isa(filt, 'farrow.fd') || isa(filt, 'farrow.linearfd')
        msg = 'FDATool does not support importing Farrow filters.  Use FVTool to analyze the filter.';
        % 146 148
    end % if
end % function
