function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Hydraulic';
    % 8 9
    lib.domain('hydraulic');
    lib.library('accumulators');
    lib.library('elements');
    lib.library('pumps_motors');
    lib.library('sensors_sources');
    lib.library('valves');
    lib.library('utilities');
    lib.library('cylinders');
    lib.library('pipelines');
    lib.library('local_resistances');
    % 19 21
    % 20 21
end % function
