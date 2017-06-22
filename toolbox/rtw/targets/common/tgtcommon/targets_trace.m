function varargout = targets_trace(action, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    switch action
    case 'model2code'
        blockFullPath = varargin{1.0};
        % 19 23
        % 20 23
        % 21 23
        traceInfo = i_getBlkTraceInfo(blockFullPath);
        varargout(1.0) = cellhorzcat(traceInfo);
    case 'code2model'
        % 25 27
        lineTextContainingRTWtag = varargin{1.0};
        % 27 30
        % 28 30
        [sysFullPath, rtwtag] = i_findSystemForRTWTag(lineTextContainingRTWtag);
        % 30 32
        if isempty(sysFullPath)
            error(horzcat('Could not trace rtw tag: "', rtwtag, '" to the model.'));
        else
            % 34 37
            % 35 37
            hilite_system(sysFullPath, 'find');
        end % if
        varargout(1.0) = cellhorzcat(sysFullPath);
    otherwise
        % 40 42
        error(horzcat('Unsupported action: ', action));
    end % switch
function traceInfo = i_getBlkTraceInfo(blockFullPath)
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    traceInfo = [];
    model = strtok(blockFullPath, '/');
    % 50 53
    % 51 53
    i_validateModelForTraceability(model);
    % 53 56
    % 54 56
    try
        blk_trace = rtwprivate('rtwctags_registry', 'get', blockFullPath);
    catch
        % 58 62
        % 59 62
        % 60 62
        errstr = horzcat('Unable to get the traceability information for block: ', '"', strrep(blockFullPath, sprintf('\n'), ' '), '". ', 'Please make sure you have built the model first. Please note that ', 'the traceability information is retained only for the last built model ', 'for the given MATLAB session.');
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        errordlg(errstr, 'No Traceability Information');
        error(errstr);
    end % try
    % 69 71
    blk_rtwname = blk_trace.rtwname;
    srcFile = [];
    for k=1.0:length(blk_trace.location)
        [pathstr, name, ext] = fileparts(blk_trace.location(k).file);
        % 74 78
        % 75 78
        % 76 78
        if strcmpi(ext, '.c')
            srcFile = blk_trace.location(k).file;
            break
        end % if
    end % for
    % 82 84
    if isempty(srcFile)
        err_str = horzcat('No RTW tag exists for: "', blockFullPath, '" in the generated code.', ' This may happen if the block was optimized away by RTW Embedded Coder', ' or if the block did not generate an RTW tag.');
        % 85 88
        % 86 88
        errordlg(err_str, 'RTW Tag Does Not Exist');
        error(err_str);
    end % if
    % 90 92
    if not(exist(srcFile, 'file'))
        errstr = horzcat('Could not find the generated file: ', srcFile, '. Please build the model first.');
        errordlg(errstr, 'Source File Not Found');
        error(errstr);
    end % if
    % 96 98
    blk_rtwname_flat = strrep(blk_rtwname, sprintf('\n'), ' ');
    % 98 101
    % 99 101
    traceInfo.blk_rtwname_flat = blk_rtwname_flat;
    traceInfo.srcFile = srcFile;
    traceInfo.blockFullPath = blockFullPath;
function [pathname, rtwtag] = i_findSystemForRTWTag(lineTextContainingRTWtag)
    % 104 113
    % 105 113
    % 106 113
    % 107 113
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    rtwtag = [];
    rtwtag = regexp(lineTextContainingRTWtag, '''<(.*?)''', 'tokens', 'once');
    if isempty(rtwtag)
        error('The line where the cursor is positioned did not produce any rtw tags. The text read is: \n %s', lineTextContainingRTWtag);
        % 116 118
    end % if
    % 118 121
    % 119 121
    rtwtag = horzcat('<', rtwtag{1.0});
    % 121 124
    % 122 124
    try
        traceInfo = rtwprivate('rtwctags_registry', 'get');
    catch
        error('Unable to get the Traceability information. Please make sure you have built the model first. Please note that the traceability information is retained only for the last built model for the givenMATLAB session.');
        % 127 131
        % 128 131
        % 129 131
    end % try
    % 131 134
    % 132 134
    pathname = [];
    for i=1.0:length(traceInfo)
        % 135 137
        rtwname_flat = strrep(traceInfo(i).rtwname, sprintf('\n'), ' ');
        if strcmp(rtwname_flat, rtwtag)
            pathname = traceInfo(i).pathname;
            break
        end % if
    end % for
function i_validateModelForTraceability(model)
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    cs = getActiveConfigSet(model);
    % 148 152
    % 149 152
    % 150 152
    if strcmpi(get_param(cs, 'IsERTTarget'), 'off') || strcmpi(get_param(cs, 'GenerateTraceInfo'), 'off') || strcmpi(get_param(cs, 'GenerateReport'), 'off') || strcmpi(get_param(cs, 'IncludeHyperlinkInReport'), 'off')
        % 152 157
        % 153 157
        % 154 157
        % 155 157
        nl = sprintf('\n');
        error(horzcat('To use the Traceability feature, please make sure your model is configured as follows:', nl, '1- Enable the generation of traceability information by adding "targets_trace_enable(gcs)"', nl, '   to the PostLoadFcn callback of the model, which can be accessed by going to ', nl, '   File --> Model Properties --> Callbacks.', nl, nl, '   Note: targets_trace_enable will also enable the "Generate HTML report" and ', nl, '   "Include hyperlinks to model" options under Real-Time Workshop in the ', nl, '   Configuration Parameters menu.', nl, nl, '2- The model has to be using an ERT based Target.'));
        % 158 166
        % 159 166
        % 160 166
        % 161 166
        % 162 166
        % 163 166
        % 164 166
    end % if
