function obj = Root(varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    mlock;
    persistent ROOT_OBJ;
    % 15 17
    if isempty(ROOT_OBJ)
        obj = feval(mfilename('class'));
        ROOT_OBJ = obj;
    else
        obj = ROOT_OBJ;
    end
end
