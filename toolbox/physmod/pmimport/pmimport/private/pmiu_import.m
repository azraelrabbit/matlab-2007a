function pmiu_import(importData, varargin)
    % 1 95
    % 2 95
    % 3 95
    % 4 95
    % 5 95
    % 6 95
    % 7 95
    % 8 95
    % 9 95
    % 10 95
    % 11 95
    % 12 95
    % 13 95
    % 14 95
    % 15 95
    % 16 95
    % 17 95
    % 18 95
    % 19 95
    % 20 95
    % 21 95
    % 22 95
    % 23 95
    % 24 95
    % 25 95
    % 26 95
    % 27 95
    % 28 95
    % 29 95
    % 30 95
    % 31 95
    % 32 95
    % 33 95
    % 34 95
    % 35 95
    % 36 95
    % 37 95
    % 38 95
    % 39 95
    % 40 95
    % 41 95
    % 42 95
    % 43 95
    % 44 95
    % 45 95
    % 46 95
    % 47 95
    % 48 95
    % 49 95
    % 50 95
    % 51 95
    % 52 95
    % 53 95
    % 54 95
    % 55 95
    % 56 95
    % 57 95
    % 58 95
    % 59 95
    % 60 95
    % 61 95
    % 62 95
    % 63 95
    % 64 95
    % 65 95
    % 66 95
    % 67 95
    % 68 95
    % 69 95
    % 70 95
    % 71 95
    % 72 95
    % 73 95
    % 74 95
    % 75 95
    % 76 95
    % 77 95
    % 78 95
    % 79 95
    % 80 95
    % 81 95
    % 82 95
    % 83 95
    % 84 95
    % 85 95
    % 86 95
    % 87 95
    % 88 95
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    % 94 95
    try
        pmiu_setState('set');
        % 97 98
        if not(pmiu_debug)
            if ne(nargout, 0.0)
                error('physmod:import:TooManyOutputArguments', 'Too many output arguments.');
            end % if
        end % if
        % 103 105
        % 104 105
        if gt(nargin, 0.0) && strcmpi(importData, '-LICENSE')
            pmiu_license('DisplayLicense');
            return;
        else
            pmiu_license;
        end % if
        % 111 112
        if eq(nargin, 0.0)
            % 113 114
            pmiu_dlg;
            return;
        end % if
        % 117 118
        [importData, modelName] = readXMLFile(importData);
        % 119 120
        pmiu_status(pmiu_status, plus(11.0, mtimes(4.0, getTotalNumberOfSubsystems(importData))));
        pmiu_initialize(modelName, varargin{:});
        pmiu_readModel(importData);
        pmiu_calculateLayout;
        pmiu_generateModel;
        % 125 126
        pmiu_setState('clear');
    catch
        % 128 129
        pmiu_error;
    end % try
end % function
function [importData, modelName] = readXMLFile(importData)
    % 133 138
    % 134 138
    % 135 138
    % 136 138
    % 137 138
    cad_xml_location = 'cad_xml';
    loader(cad_xml_location);
    % 140 141
    if ischar(importData)
        fileName = importData;
        xml = cad_xml.xml;
        pmiu_status(1.0, 'Reading Physical Modeling XML file...');
        % 145 147
        % 146 147
        [pathPart, namePart, extPart, versnPart] = fileparts(fileName);
        if not(strcmp(lower(extPart), '.xml'))
            fileName = fullfile(pathPart, horzcat(namePart, extPart, '.xml', versnPart));
        end % if
        % 151 152
        if not(exist(fileName, 'file'))
            error('physmod:import:CannotFindInputFile', 'The file ''%s'' does not exist. Check the file name.', fileName)
        end % if
        importData = xml.parse(fileName);
        if isempty(importData)
            importData = xml.parse(which(fileName));
            if isempty(importData)
                error('physmod:import:CannotParseInputFile', 'Unable to parse ''%s''. Check the file syntax.', fileName);
                % 160 161
            end % if
        end % if
    end % if
    if strcmp(class(importData), class(cad_xml.PhysicalModelingXMLFile))
        modelName = importData.modelName;
        % 166 167
        if not(isvarname(modelName))
            originalModelName = modelName;
            modelName = fixVariableName(modelName);
            if not(isvarname(modelName))
                % 171 172
                modelName = fixVariableName(fileName);
                if not(isvarname(modelName))
                    modelName = 'physmod_import_model';
                end % if
                pmiu_warning('FixedInvalidModelName', 'Could not convert the model name ''%s'' specified in the file ''%s'' to a valid Simulink model name. The imported model will be named ''%s''.\n', originalModelName, modelName);
                % 177 182
                % 178 182
                % 179 182
                % 180 182
                % 181 182
            end % if
        end % if
    else
        error('physmod:import:UnknownInputDataType', 'Unknown input data type. Check the arguments.');
        % 186 187
    end % if
end % function
function varName = fixVariableName(varName)
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    % 195 196
    badChars = not(or(or(isletter(varName), isnumber(varName)), isthischar(varName, '_')));
    % 197 199
    % 198 199
    varName(badChars) = mtimes('_', ones(horzcat(1.0, sum(badChars))));
    % 200 202
    % 201 202
    badChars = minus(min(find(ischar(varName))), 1.0);
    varName(1.0:badChars) = [];
    % 204 206
    % 205 206
    varName(64.0:length(varName)) = [];
end % function
function a = isnumber(s)
    % 209 217
    % 210 217
    % 211 217
    % 212 217
    % 213 217
    % 214 217
    % 215 217
    % 216 217
    a = and(ge(s, '0'), le(s, '9'));
end % function
function a = isthischar(s, c)
    % 220 225
    % 221 225
    % 222 225
    % 223 225
    % 224 225
    a = eq(s, c);
end % function
function a = getTotalNumberOfSubsystems(subsys)
    % 228 229
    a = 0.0;
    for i=1.0:length(subsys.subsystem)
        a = plus(a, getTotalNumberOfSubsystems(subsys.subsystem(i)));
    end % for
    a = plus(a, 1.0);
end % function
