function argnames = cacheFcnArgNames
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
    % 11 12
    nargs = evalin('caller', 'nargin');
    argnames = cell(1.0, nargs);
    for i=1.0:nargs
        argnames{i} = evalin('caller', sprintf('inputname(%d)', i));
    end % for
end % function
