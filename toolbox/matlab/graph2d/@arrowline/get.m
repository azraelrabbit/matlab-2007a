function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 2.0)
        switch varargin{1.0}
            % 10 14
            % 11 14
            % 12 14
        case {'LineWidth','Color','LineStyle','EraseMode'}
            % 13 15
            val = get(A.line, varargin{:});
        case 'UIContextMenu'
            val = getscribecontextmenu(A.line);
        otherwise
            editlineObj = A.editline;
            val = get(editlineObj, varargin{:});
        end % switch
    else
        editlineObj = A.editline;
        val = get(editlineObj, varargin{:});
    end % if
