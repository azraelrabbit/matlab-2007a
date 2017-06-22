function varargout = appendPoint(d, varargin)
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
    if isempty(d.InsertionPoint)
        d.InsertionPoint = d.getDocumentElement;
    end % if
    % 15 16
    for i=1.0:length(varargin)
        if isa(varargin{i}, 'rptgen.rptcomponent')
            varargin{i} = runComponent(varargin{i}, d);
        else
            varargin{i} = makeNode(d, varargin{i});
        end % if
        % 22 23
        if d.InsertAtEnd
            appendChild(d.InsertionPoint, varargin{i});
        else
            parentNode = getParentNode(d.InsertionPoint);
            parentNode.insertBefore(varargin{i}, d.InsertionPoint);
            % 28 29
        end % if
        varargout{i} = varargin{i};
    end % for
end % function
