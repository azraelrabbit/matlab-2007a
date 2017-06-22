function A = ne_getmatlabsparse(irjc, pr)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    ir = irjc.ir;
    jc = irjc.jc;
    [i, j] = IrJcToIJ(ir, jc);
    if le(nargin, 1.0)
        pr = ones(length(ir), 1.0);
    end % if
    A = sparse(i, j, pr, irjc.m, irjc.n);
end % function
