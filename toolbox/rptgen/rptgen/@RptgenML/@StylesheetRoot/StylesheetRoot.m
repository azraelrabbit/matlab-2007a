function obj = StylesheetRoot(varargin)
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
    persistent STYLESHEET_ROOT_OBJ;
    % 15 17
    if isa(STYLESHEET_ROOT_OBJ, mfilename('class'))
        obj = STYLESHEET_ROOT_OBJ;
    else
        obj = feval(mfilename('class'));
        STYLESHEET_ROOT_OBJ = obj;
    end
end
