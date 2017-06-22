function objHandle = getTestObject(h, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    load_system('temp_rptgen_model');
    % 10 12
    objHandle = find(slroot, '-isa', horzcat('Stateflow.', rptgen.capitalizeFirst(objType)));
    if not(isempty(objHandle))
        objHandle = objHandle(1.0);
    end % if
