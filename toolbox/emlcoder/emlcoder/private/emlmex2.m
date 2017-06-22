function report = emlmex2(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    try
        report = doit(varargin{:});
    catch
        err = lasterror;
        if ~(fail(err))
            msgText = sprintf('%s\nUse ''help emlmex'' for more information on using this command.', err.message);
            % 14 16
            error('emlcoder:compile', '%s\n', msgText);
        end
        report = [];
    end % try
end
function report = doit(varargin)
    % 21 24
    % 22 24
    [project, options, fcnName] = parseargs(varargin{:});
    if isempty(fcnName)
        return
    end
    report = compile(project, options, fcnName);
    report.summary.directory = options.LogDirectory;
    save(horzcat(options.LogDirectory, filesep, fcnName, '_report.mat'), 'report');
    cfg = getCurrentTargetConfig(project);
    if ~(isempty(report.summary.messageList)) || cfg.GenerateReport
        genreport(project, report);
    end
end
function cfg = getCurrentTargetConfig(project)
    % 36 40
    % 37 40
    % 38 40
    cfg = [];
    if ~(isempty(project.ConfigSet))
        if ~(isempty(project.ConfigSet.CompilerOptions))
            cfg = project.ConfigSet.MEXConfig;
        end
    end
    if isempty(cfg)
        cfg = emlcoder.MEXConfig;
    end
end
function genreport(project, report)
    % 50 54
    % 51 54
    % 52 54
    try
        mainhtml = emcvhtml(report);
        showMessageSummary(report);
        if ~(report.summary.passed)
            prefix = 'C-MEX generation failed';
            rptype = 'error';
        else
            prefix = 'C-MEX generation successful';
            rptype = 'coder';
            if ~(isempty(report.summary.messageList))
                prefix = horzcat(prefix, ' (with warnings)');
            end
        end
        if HasDesktop
            href = sprintf('matlab: open(''%s'');', mainhtml);
            disp(horzcat(prefix, ': <a href="', href, ' ">Open ', rptype, ' report.</a>'));
            cfg = getCurrentTargetConfig(project);
            if cfg.LaunchReport
                open(mainhtml);
            end
        else
            disp(horzcat(prefix, ': C-MEX generation report at ''', mainhtml, ''''));
        end
    catch
        rethrow(lasterror);
        disp('C-MEX generation failed.');
    end % try
end
function showMessageSummary(report)
    % 82 85
    % 83 85
    if isempty(report.summary.messageList)
        return
    end
    found = false;
    for messageId=1.0:numel(report.summary.messageList)
        message = report.summary.messageList{messageId};
        if ~(strcmp(message.type, 'Warning')) && ~(message.isFcnCallFailed)
            found = true;
            break
        end
    end % for
    if ~(found)
        messageId = 1.0;
        message = report.summary.messageList{messageId};
    end
    msgText = sprintf('??? %s', message.text);
    disp(msgText);
    scriptId = message.scriptId;
    if ne(scriptId, 0.0)
        script = report.scripts{scriptId};
        if ~(isempty(script.name))
            [lineNo, colNo] = messageLineno(script, message.start);
            GenOpenToLine(script.name, script.filepath, lineNo, colNo, message.type);
        end
    end
end
function report = compile(project, options, fcnName)
    % 111 113
    project.EntryPoints(1.0).Name = fcnName;
    project.Name = fcnName;
    project.BldDirectory = options.BldDirectory;
    if ~(isempty(options.outputfile))
        project.Filename = options.outputfile;
    else
        project.FileName = fcnName;
    end
    buildInfo = RTW.BuildInfo;
    report = project.compile(buildInfo);
    if ~(options.preserve)
        rmdir(options.BldDirectory, 's');
    end
end
function [project, options, fcnName] = parseargs(varargin)
    % 127 130
    % 128 130
    cfgset = emlcoder.ConfigSet;
    cfgset.HardwareImplementation = emlcoder.HardwareImplementation;
    cfgset.CompilerOptions = emlcoder.CompilerOptions;
    cfgset.MEXConfig = emlcoder.MEXConfig;
    cfgset.RTWConfig = emlcoder.RTWConfig;
    project = emlcoder.Project;
    project.ConfigSet = cfgset;
    project.OutDirectory = pwd;
    project.EntryPoints = emlcoder.EntryPoint;
    project.SearchPath = '';
    % 139 141
    options.LogDirectory = [];
    options.outputfile = [];
    options.help = false;
    options.preserve = false;
    fcnName = [];
    argc = 1.0;
    while le(argc, nargin)
        arg = varargin{argc};
        if ~(ischar(arg))
            disp(arg);
            ccerror('Cannot process the above options');
        end
        if eq(arg(1.0), '-')
            if lt(numel(arg), 2.0)
                ccerror(horzcat('Unrecognized option: ', arg));
            end
            switch arg(2.0:end)
            case {'d','outputdir'}
                argc = checkOptHasParam(arg, argc, nargin);
                options.LogDirectory = varargin{argc};
            case 'eg'
                argc = checkOptHasParam(arg, argc, nargin);
                eg = varargin{argc};
                if ~(isempty(eg))
                    parseExamples(project, eg);
                end
            case {'F','fimath'}
                argc = checkOptHasParam(arg, argc, nargin);
                fm = evalArg(varargin{argc});
                if ~(isfimath(fm))
                    ccerror(horzcat('Invalid parameter to option "', arg, '"'));
                end
                project.ConfigSet.fimath = fm;
            case {'g','G','debug'}
                project.ConfigSet.CompilerOptions.EnableDebugging = true;
            case {'I','include'}
                argc = checkOptHasParam(arg, argc, nargin);
                dir = varargin{argc};
                if isa(dir, 'char') && eq(dir(1.0), '[')
                    dir = eval(dir);
                end
                addSearchPath(project, dir);
            case {'N','numerictype'}
                argc = checkOptHasParam(arg, argc, nargin);
                nt = evalArg(varargin{argc});
                if ~(isnumerictype(nt))
                    ccerror(horzcat('Invalid parameter to option "', arg, '"'));
                end
                project.ConfigSet.numerictype = nt;
            case {'o','outputfile'}
                argc = checkOptHasParam(arg, argc, nargin);
                options.outputfile = varargin{argc};
            case {'O','optim'}
                argc = checkOptHasParam(arg, argc, nargin);
                parseOptimization(project, varargin{argc});
            case 'preserve'
                options.preserve = true;
                project.ConfigSet.MEXConfig.GenerateReport = true;
            case '?'
                options.help = true;
            otherwise
                ccerror(horzcat('Unrecognized option: ', arg));
            end
        else
            fcnName = parseFilename(fcnName, arg);
        end
        argc = plus(argc, 1.0);
    end % while
    if options.help
        genHelp;
        if isempty(fcnName)
            return
        end
    end
    fcnName = checkFcnName(project, fcnName);
    options = checkOutputName(project, options);
    if isempty(options.LogDirectory)
        options.LogDirectory = fullfile(pwd, 'emcprj', 'mexfcn', fcnName);
    end
    if eq(fileattrib(options.LogDirectory), 0.0)
        mkdir(options.LogDirectory);
    end
    [status, attributes] = fileattrib(options.LogDirectory);
    if ~(status)
        ccerror(horzcat('Cannot access directory "', options.LogDirectory, '"'));
    end
    options.LogDirectory = attributes.Name;
    if options.preserve
        options.BldDirectory = options.LogDirectory;
    else
        if isempty(tempdir)
            ccerror('Cannot locate system''s temporary directory (tempdir)');
        end
        options.BldDirectory = fullfile(tempdir, 'emcprj', 'mexfcn');
        [status, attributes] = fileattrib(options.BldDirectory);
        if ne(status, 0.0)
            if ne(attributes.directory, 0.0)
                rmdir(options.BldDirectory, 's');
            else
                delete(options.BldDirectory);
            end
        end
        status = mkdir(options.BldDirectory);
        if ~(status)
            ccerror(horzcat('Cannot access directory "', options.BldDirectory, '"'));
        end
    end
end
function genHelp
    help('emlmex');
end
function parseExamples(project, arg)
    val = evalArg(arg);
    if ~(iscell(val))
        val = cellhorzcat(val);
    end
    for i=1.0:numel(val)
        idps(i) = example2idp(val{i}, horzcat('u', num2str(i)));
    end % for
    project.EntryPoints(1.0).InputDataProps = idps;
end
function val = evalArg(arg)
    if isempty(arg)
        ccerror('Empty command-line arguments are not supported');
    end
    if ischar(arg)
        try
            val = evalin('base', arg);
        catch
            val = [];
        end % try
    else
        val = arg;
    end
    if isempty(val)
        if ischar(arg)
            text = horzcat('"', arg, '"');
        else
            text = 'argument';
        end
        ccerror(horzcat('Failed to evaluate ', text, ' to non-empty array in the base workspace'));
    end
end
function idp = example2idp(ex, name)
    % 284 287
    % 285 287
    theClass = class(ex);
    switch theClass
    case {'single','double','logical','char','int8','uint8','int16','uint16','int32','uint32'}
        % 289 294
        % 290 294
        % 291 294
        % 292 294
        idp = emlcoder.InputDataProperty(name);
        idp.class = theClass;
        idp.Complex = ~(isreal(ex));
    case 'embedded.fi'
        idp = emlcoder.FiInputDataProperty(name);
        idp.class = theClass;
        idp.Complex = ~(isreal(ex));
        idp.numerictype = ex.numerictype;
        idp.fimath = ex.fimath;
        switch ex.DataTypeMode
        case {'single','double','boolean','Scaled double: binary point scaling'}
            % 304 309
            % 305 309
            % 306 309
            % 307 309
            ccerror(horzcat('Example input contains a "', ex.DataTypeMode, '" fixed-point data type. This is not supported.'));
            % 309 312
            % 310 312
            % 311 313
        end
        if gt(ex.WordLength, 32.0)
            ccerror('Example input fixed-point type exceeds 32 bits. This is not supported.');
        end
    case 'struct'
        idp = emlcoder.StructInputDataProperty(name);
        idp.class = theClass;
        fldNames = fieldnames(ex);
        if isempty(fldNames)
            ccerror('Example input contains an empty structure. This is not supported.');
        end
        for i=1.0:numel(fldNames)
            fldName = fldNames{i};
            fldVal = ex.(fldName);
            fldidps(i) = example2idp(fldVal, fldName);
        end % for
        idp.Members = fldidps;
    otherwise
        ccerror(horzcat('Expecting example input: found unsupported class "', theClass, '"'));
    end
    idp.Size = size(ex);
end
function fcnName = parseFilename(fcnName, arg)
    % 335 337
    if isempty(fcnName)
        fcnName = arg;
    else
        ccerror(horzcat('Multiple function names specified: "', fcnName, '" and "', arg, '"'));
    end
end
function argc = checkOptHasParam(arg, argc, nargs)
    % 343 346
    % 344 346
    if ge(argc, nargs)
        ccerror(horzcat('Missing parameter to option "', arg, '"'));
    end
    argc = plus(argc, 1.0);
end
function addSearchPath(project, dir)
    % 351 354
    % 352 354
    if ne(numel(project.SearchPath), 0.0)
        project.SearchPath = horzcat(project.SearchPath, pathsep);
    end
    project.SearchPath = horzcat(project.SearchPath, dir);
end
function fcnName = checkFcnName(project, fcnName)
    % 359 362
    % 360 362
    if isempty(fcnName)
        ccerror('No function name specified');
    end
    if ~(ischar(fcnName))
        ccerror('Invalid function name specified');
    end
    [dir, fcnName] = fileparts(fcnName);
    if ~(isempty(dir))
        addSearchPath(project, dir);
    end
end
function options = checkOutputName(project, options)
    if ~(isempty(options.outputfile))
        [pathstr, options.outputfile, ext] = fileparts(options.outputfile);
    else
        pathstr = '';
        ext = '';
    end
    if ~(isempty(ext))
        if ~(strcmp(ext, horzcat('.', mexext)))
            ccerror(horzcat('Output file extension: "', ext, '" is not supported'));
        end
    end
    if ~(isempty(pathstr))
        [stat, attr] = fileattrib(pathstr);
        if ne(stat, 1.0) || ~(attr.directory)
            ccerror(horzcat('Output file directory "', pathstr, '" does not exist'));
        end
        project.OutDirectory = attr.Name;
        options.LogDirectory = attr.Name;
    end
end
function parseOptimization(project, arg)
    % 394 401
    % 395 401
    % 396 401
    % 397 401
    % 398 401
    % 399 401
    if ~(ischar(arg))
        reject(arg);
    end
    tokens = regexp(arg, '(\w*)(:)(\w*)', 'tokens', 'once');
    if ne(numel(tokens), 3.0)
        reject(arg);
    end
    switch tokens{1.0}
    case 'enable'
        enable = true;
    case 'disable'
        enable = false;
    otherwise
        reject(arg)
    end
    switch tokens{3.0}
    case 'inline'
        project.ConfigSet.CompilerOptions.EnableInlining = enable;
    otherwise
        reject(arg)
    end
end
function reject(arg)
    msg = sprintf('Invalid optimization specification "%s".\nUse the format "enable:optimization" or "disable:optimization",\nwhere "optimization" is one of "inline", ...', arg);
    % 424 426
    ccerror(msg);
end
function ccerror(msg)
    % 428 431
    % 429 431
    msgText = sprintf('Error: %s', msg);
    disp(msgText);
    error(':emlcoder:throw:');
end
function caught = fail(err)
    % 435 438
    % 436 438
    idx = findstr(err.message, ':emlcoder:throw:');
    caught = ~(isempty(idx));
    if caught
        if HasDesktop
            href = sprintf('matlab: help(''emlmex'')');
            disp(horzcat('Use <a href="', href, '">help emlmex</a> for more information on using this command.'));
        else
            disp('Use help emlmex for more information on using this command.');
        end
    end
end
