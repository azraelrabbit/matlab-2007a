function hChild = getcomponent(hParent, tag, varargin)
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
    msg = nargchk(2.0, Inf, nargin);
    error(msg)
    % 16 18
    if gt(nargin, 2.0)
        varargin = cellhorzcat(tag, varargin{:});
    else
        if gt(nargin, 1.0)
            varargin = cellhorzcat('Tag', tag);
        end
    end
    hChild = allchild(hParent);
    if not(isempty(hChild))
        hChild = find(hChild, '-depth', 0.0, varargin{:});
    end
end
