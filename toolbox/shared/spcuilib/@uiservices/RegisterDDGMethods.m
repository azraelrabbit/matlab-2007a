function RegisterDDGMethods(hDerived, select)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    allSelections = {'getdialogschema','validate','closedlg','getdisplayicon'};
    if lt(nargin, 2.0)
        select = allSelections;
    end % if
    if any(strcmpi(allSelections{1.0}, select))
        m = schema.method(hDerived, 'getDialogSchema');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
    if any(strcmpi(allSelections{2.0}, select))
        m = schema.method(hDerived, 'validate');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {'bool','string'};
    end % if
    if any(strcmpi(allSelections{3.0}, select))
        m = schema.method(hDerived, 'closedlg');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
    end % if
    if any(strcmpi(allSelections{4.0}, select))
        m = schema.method(hDerived, 'getDisplayIcon');
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {'string'};
    end % if
end % function
