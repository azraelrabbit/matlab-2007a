function tf = displayAsTable(h, dValue)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch h.DisplayTable
    case 'table'
        tf = logical(1);
    case {'text','para'}
        tf = logical(0);
    otherwise
        if isa(dValue, 'org.w3c.dom.Node')
            tf = logical(0);
        else
            if ischar(dValue)
                tf = logical(0);
            else
                if isnumeric(dValue)
                    tf = gt(min(size(dValue)), 1.0);
                else
                    tf = not(isempty(dValue));
                end
            end
        end
    end
end
