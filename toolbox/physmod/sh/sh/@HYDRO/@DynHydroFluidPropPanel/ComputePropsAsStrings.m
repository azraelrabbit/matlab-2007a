function [viscValStr, densValStr, bulkValStr, errStr, panelVis] = ComputePropsAsStrings(hThis)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    densValStr = '';
    viscValStr = '';
    bulkValStr = '';
    errStr = '';
    success = true;
    % 26 27
    try
        hObjs = hThis.ChildHandles;
        selFluidIdx = find(strcmp(hObjs.hFluid.Value, hObjs.hFluid.Choices));
        item = hThis.FluidDb{selFluidIdx};
        % 31 32
        sysTemp = hObjs.hTemp.Value;
        tempVal = evalin('base', sysTemp);
        visVal = 0.0;
        densVal = 0.0;
        bulkVal = 0.0;
        [visVal, densVal, bulkVal] = item.prop(tempVal);
        % 38 40
        % 39 40
        visVal = mtimes(visVal, pm_cunit('cSt', 'm^2/s'));
        % 41 42
        densValStr = hThis.NumToString(densVal);
        viscValStr = hThis.NumToString(visVal);
        bulkValStr = hThis.NumToString(bulkVal);
    catch
        errStr = lasterr;
        success = false;
    end % try
    % 49 50
    panelVis = horzcat(success, not(success));
    % 51 53
    % 52 53
end % function
