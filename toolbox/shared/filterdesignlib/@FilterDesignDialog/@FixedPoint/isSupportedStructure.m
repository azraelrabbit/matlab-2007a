function b = isSupportedStructure(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0)
        structure = get(classhandle(Hd), 'Name');
    else
        structure = get(this, 'Structure');
    end % if
    % 13 16
    % 14 16
    % 15 16
    b = any(strcmpi(structure, {'df1sos','df1','df1t','df1tsos','dffir','df2','dfasymfir','df2sos','latticeallpass','df2tsos','dffirt','df2t','dfsymfir','latticear','cicdecim','cicinterp','firdecim','firsrc','holdinterp','linearinterp','firinterp','firtdecim','latticemamax','latticemamin','latticearma','scalar','delay','fd'}));
    % 17 20
    % 18 20
    % 19 20
end % function
