function out = execute(this, d, obj)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 3.0)
        obj = this.atGetObjects;
    end % if
    % 13 15
    if isempty(obj)
        out = [];
        % 16 18
        return;
    else
        if ischar(obj)
            obj = cellhorzcat(obj);
            subsrefType = '{}';
        else
            if iscell(obj)
                subsrefType = '{}';
            else
                subsrefType = '()';
            end % if
        end % if
    end % if
    out = d.createDocumentFragment;
    for i=1.0:length(obj)
        out.appendChild(this.atMakeAutoTable(d, subsref(obj, substruct(subsrefType, cellhorzcat(i)))));
    end % for
end % function
