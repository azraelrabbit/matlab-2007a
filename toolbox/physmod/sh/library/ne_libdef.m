function [name, fcn] = ne_libdef
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    name = 'sh';
    fcn = @lLib;
    % 12 13
end % function
function lLib(root, lib)
    % 15 18
    % 16 18
    % 17 18
    lib.descriptor = 'SimHydraulics';
    % 19 20
    lib.library('accumulators');
    lib.library('pumps_motors');
    lib.library('valves');
    lib.library('cylinders');
    lib.library('pipelines');
    lib.library('local_resistances');
    lib.library('orifices');
    lib.library('utilities');
    % 28 29
end % function
