function id = getObjectID(ps, obj, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if isempty(obj.ClassPointer)
        id = '';
    else
        psClass = rptgen_ud.propsrc_ud_class;
        id = getObjectID(psClass, obj.ClassPointer, varargin{:});
    end % if
end % function
