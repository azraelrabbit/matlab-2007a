function [x, z, u, udot] = ne_odetods(t, y, prob, probaux)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [x, z] = ne_splity(y, probaux.nx);
    [u, udot] = ne_evalinputsandknownderivs(t, probaux.u, prob.analysisType);
end % function
