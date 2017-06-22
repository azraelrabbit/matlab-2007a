function summ_set(c, objType, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if (lt(nargin, 2.0)) | (isempty(objType))
        objType = c.LoopType;
    end
    % 11 13
    src = c.summ_get(objType);
    set(src, varargin{:});
end
