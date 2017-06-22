function A = ne_tosparse(logicalsparse, pr)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if le(nargin, 1.0)
        A = double(logicalsparse);
    else
        A = sparse(size(logicalsparse, 1.0), size(logicalsparse, 2.0));
        A(find(logicalsparse)) = pr;
    end % if
end % function
