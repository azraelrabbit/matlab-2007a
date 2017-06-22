function [u, udot] = ne_evalinputsandknownderivs(t, uIn)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    u = zeros(length(uIn.tr), 1.0);
    for i=1.0:length(uIn.tr)
        u(i) = uIn.tr{i}(t);
    end % for
    udot = zeros(size(u));
    if isfield(uIn, 'whichderivsknown')
        for i=1.0:length(uIn.whichderivsknown)
            udot(uIn.whichderivsknown(i)) = uIn.knownderivs{i}(t);
        end % for
    end % if
end % function
