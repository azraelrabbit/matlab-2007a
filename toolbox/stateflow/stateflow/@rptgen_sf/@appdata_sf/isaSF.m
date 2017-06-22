function tf = isaSF(adSF, obj, oType)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    oType = horzcat('Stateflow.', rptgen.capitalizeFirst(oType));
    % 8 10
    tf = isa(obj, oType);
