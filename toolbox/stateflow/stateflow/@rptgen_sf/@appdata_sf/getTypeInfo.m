function ti = getTypeInfo(adSF, objType, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if lt(nargin, 2.0)
        ti = adSF.TypeTable;
        % 17 19
        return;
    end % if
    % 20 22
    if ischar(objType)
        idx = find(strcmpi(cellhorzcat(adSF.TypeTable.Name), objType));
        if isempty(idx)
            error('rgsf:InvalidType', 'Object type "%s" not found', objType);
        else
            ti = adSF.TypeTable(idx);
            if gt(length(varargin), 0.0)
                ti = getfield(ti, varargin{1.0});
            end % if
        end % if
    else
        if ishandle(objType)
            objType = get(classhandle(objType), 'Name');
            ti = getTypeInfo(adSF, objType, varargin{:});
        else
            error('rgsf:InvalidInputArgument', 'Second argument must be a string or Stateflow.Object');
        end % if
    end % if
end % function
