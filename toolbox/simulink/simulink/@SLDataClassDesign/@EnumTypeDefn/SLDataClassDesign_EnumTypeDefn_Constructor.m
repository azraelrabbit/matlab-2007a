function h = SLDataClassDesign_EnumTypeDefn_Constructor(h, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    nargin = length(varargin);
    % 19 21
    % 20 21
    switch nargin
    case 0.0
    case 2.0
        h.EnumTypeName = varargin{1.0};
        h.EnumStrings = varargin{2.0};
    otherwise
        error('Invalid number of input arguments');
    end % switch
end % function
