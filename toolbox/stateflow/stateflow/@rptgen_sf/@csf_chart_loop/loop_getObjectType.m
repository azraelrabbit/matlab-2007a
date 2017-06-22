function oType = loop_getObjectType(h, obj, ps)
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
    if (lt(nargin, 2.0)) | (isempty(obj))
        oType = 'Chart';
    else
        oType = ps.getObjectType(obj);
        % 15 17
    end
end
