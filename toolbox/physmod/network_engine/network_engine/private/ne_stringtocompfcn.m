function fcn = ne_stringtocompfcn(fcn, varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    persistent MAP;
    % 19 21
    if not(ischar(fcn))
        pm_error('network_engine:ne_stringtocmpfcn:InvalidInputType');
    end
    % 23 25
    includeMsgText = false;
    fcnText = fcn;
    % 26 28
    if eq(nargin, 2.0) && strcmpi(varargin, '-message')
        includeMsgText = true;
    end
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if isempty(MAP)
        MAP = vertcat(cellhorzcat('==', @eq, 'equal to'), cellhorzcat('~=', @ne, 'not be equal to'), cellhorzcat('<', @lt, 'less than'), cellhorzcat('>', @gt, 'greater than'), cellhorzcat('<=', @le, 'less than or equal to'), cellhorzcat('>=', @ge, 'greater than or equal to'));
        % 36 42
        % 37 42
        % 38 42
        % 39 42
        % 40 42
    end
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    idx = strcmp(MAP(:, 1.0), fcn);
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    if any(idx)
        fcn = MAP{idx, 2.0};
    else
        fcn = str2func(fcn);
    end
    % 57 59
    if eq(nargin, 2.0) && strcmpi(varargin, '-message')
        if any(idx)
            fcn = cellhorzcat(fcn, MAP{idx, 3.0});
        else
            fcn = cellhorzcat(fcn, fcnText);
        end
    end
end
