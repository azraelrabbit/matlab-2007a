function varargout = rtwattic(method, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    mlock
    persistent USERDATA;
    % 11 13
    [USERDATA, varargout{1.0:nargout}] = feval(method, USERDATA, varargin{1.0:end});
end
function userdata = clean(userdata)
    % 15 19
    % 16 19
    % 17 19
    SourceSubsystemName = rtwattic('getSourceSubsystemName');
    BuildDir = rtwattic('getBuildDir');
    % 20 22
    clear userdata;
    userdata = '';
    % 23 25
    clear rtwname2origname;
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    if not(isempty(SourceSubsystemName))
        userdata.buildDir = BuildDir;
    end
end
function userdata = setSourceSubsystemName(userdata, sourceSubsystemName)
    % 34 37
    % 35 37
    userdata.ssname = sourceSubsystemName;
end
function [userdata, sourceSubsytemName] = getSourceSubsystemName(userdata)
    % 39 43
    % 40 43
    % 41 43
    sourceSubsytemName = localGetMethode(userdata, 'ssname');
end
function userdata = setNewModelName(userdata, newModelName)
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    userdata.newModelName = newModelName;
end
function [userdata, newModelName] = getNewModelName(userdata)
    % 52 56
    % 53 56
    % 54 56
    newModelName = localGetMethode(userdata, 'newModelName');
end
function userdata = setBuildDir(userdata, buildDirectory)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    userdata.buildDir = buildDirectory;
end
function [userdata, sourceSubsytemName] = getBuildDir(userdata)
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    sourceSubsytemName = localGetMethode(userdata, 'buildDir');
end
function userdata = setStartDir(userdata, startDir)
    % 72 75
    % 73 75
    userdata.startDir = startDir;
end
function [userdata, startDir] = getStartDir(userdata)
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    startDir = localGetMethode(userdata, 'startDir');
end
function userdata = setContentsFileName(userdata, contentsFileName)
    % 84 88
    % 85 88
    % 86 88
    userdata.contentsFileName = contentsFileName;
end
function [userdata, contentsFileName] = getContentsFileName(userdata)
    % 90 94
    % 91 94
    % 92 94
    contentsFileName = localGetMethode(userdata, 'contentsFileName');
end
function userdata = setReportFileName(userdata, reportFileName)
    % 96 100
    % 97 100
    % 98 100
    userdata.reportFileName = reportFileName;
end
function [userdata, reportFileName] = getReportFileName(userdata)
    % 102 106
    % 103 106
    % 104 106
    reportFileName = localGetMethode(userdata, 'reportFileName');
end
function userdata = setSystemMap(userdata, systemMap)
    % 108 112
    % 109 112
    % 110 112
    if not(iscell(systemMap))
        systemMap = strrep(systemMap, sprintf('\n'), '\n');
        systemMap = eval(systemMap);
        for i=1.0:length(systemMap)
            systemMap{i} = strrep(systemMap{i}, '\n', sprintf('\n'));
        end % for
    end
    userdata.systemMap = systemMap;
end
function [userdata, systemMap] = getSystemMap(userdata)
    % 121 125
    % 122 125
    % 123 125
    systemMap = localGetMethode(userdata, 'systemMap');
    if isempty(systemMap)
        systemMap = {};
    end
end
function userdata = setOkayToPushNag(userdata, OkayToPushNag)
    % 130 134
    % 131 134
    % 132 134
    userdata.OkayToPushNag = OkayToPushNag;
end
function [userdata, OkayToPushNag] = getOkayToPushNag(userdata)
    % 136 140
    % 137 140
    % 138 140
    OkayToPushNag = localGetMethode(userdata, 'OkayToPushNag');
    if isempty(OkayToPushNag)
        OkayToPushNag = false;
    end
end
function [userdata, value] = getParam(userdata, sys, field)
    % 145 148
    % 146 148
    value = get_param(sys, field);
    if not(ischar(value))
        if isnumeric(value)
            value = num2str(value);
        end
    end
end
function [userdata, str] = c_indent_from_tlc(userdata, file, opts)
    % 155 158
    % 156 158
    file = horzcat(rtwprivate('rtwattic', 'getBuildDir'), filesep, file);
    % 158 160
    if eq(feature('RTWBeautifier'), 1.0)
        if eq(license('test', 'RTW_Embedded_Coder'), 1.0)
            if eq(nargin, 2.0)
                c_beautifier(file);
            else
                c_beautifier(opts, file);
            end
        else
            if eq(nargin, 2.0)
                c_beautifier('-nolicense', file);
            else
                c_beautifier('-nolicense', opts, file);
            end
        end
    else
        if eq(nargin, 2.0)
            c_indent(file);
        else
            c_indent(opts, file);
        end
    end
    % 180 182
    str = '';
end
function value = localGetMethode(userdata, elementName)
    % 184 187
    % 185 187
    if isfield(userdata, elementName)
        value = eval(horzcat('userdata.', elementName));
    else
        value = '';
    end
end
function [StateVar, returnVal] = AtticData(StateVar, varargin)
    % 193 203
    % 194 203
    % 195 203
    % 196 203
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    returnVal = [];
    switch nargin
    case 2.0
        if isempty(varargin{1.0})
            % 206 208
            returnVal = StateVar;
        else
            if isfield(StateVar, varargin{1.0})
                returnVal = eval(horzcat('StateVar.', varargin{1.0}));
            end
        end
    case 3.0
        if isstr(varargin{1.0})
            eval(horzcat('StateVar.', varargin{1.0}, ' =  varargin{2};'));
        end
    end
    return
end
