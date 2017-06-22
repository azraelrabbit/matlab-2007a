function [s, newDataType] = toStringExe(v, dataType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if lt(nargin, 2.0)
        dataType = class(v);
    end % if
    % 11 13
    switch dataType
    case {'bool','LOGICAL'}
        if v
            s = 'true';
        else
            s = 'false';
        end % if
        newDataType = 'bool';
    case {'double','int32','NUMBER'}
        s = sprintf('[%s]', num2str(v));
        newDataType = 'double';
    case {'string','STRING','RGParsedString'}
        s = horzcat('''', strrep(rptgen.toString(v, 0.0), '''', ''''''), '''');
        newDataType = 'string';
    case {'string vector','CELL'}
        s = '{';
        % 28 30
        for i=1.0:length(v)
            s = horzcat(s, '''', strrep(rptgen.toString(v{i}, 0.0), '''', ''''''), ''', ');
        end % for
        s = horzcat(s, '}');
        newDataType = 'string vector';
    otherwise
        s = '[]';
        newDataType = 'MATLAB array';
        warning('RPTGEN:StringToExecutableConversion', 'Could not convert value to string');
        % 38 40
    end % switch
