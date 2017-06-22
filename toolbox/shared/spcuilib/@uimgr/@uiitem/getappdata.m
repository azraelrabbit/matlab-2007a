function [y, isvalid] = getappdata(h, name)
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
    d = h.AppData;
    if lt(nargin, 2.0)
        % 20 22
        isvalid = true;
        y = d;
    else
        % 24 26
        isvalid = isfield(d, name);
        cellResult = iscell(name);
        if ~(cellResult)
            if isvalid
                y = d.(name);
            else
                y = [];
            end
        else
            for i=1.0:numel(isvalid)
                if isvalid(i)
                    y{i} = d.(name{i});
                else
                    y{i} = [];
                end
            end % for
        end
    end
end
