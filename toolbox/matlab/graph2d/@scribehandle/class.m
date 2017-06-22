function val = class(hndl, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 1.0)
        if not(isempty(hndl))
            if gt(length(hndl), 1.0)
                hndl = hndl(1.0);
            end % if
            ud = getscribeobjectdata(hndl.HGHandle);
            MLObj = ud.ObjectStore;
            val = class(MLObj);
        else
            val = 'scribehandle';
        end % if
    else
        val = builtin('class', hndl, varargin{:});
    end % if
end % function
