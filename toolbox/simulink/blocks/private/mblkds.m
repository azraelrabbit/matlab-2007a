function [width, smap] = mblkds(nreg, rind)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    width = plus(nreg, nreg);
    smap = plus(nreg, 1.0:nreg);
    if not(isempty(rind))
        if any(gt(rind, nreg))
            error('Input indices out of range.');
        else
            smap(rind) = rind;
        end % if
    end % if
    return;
end % function
