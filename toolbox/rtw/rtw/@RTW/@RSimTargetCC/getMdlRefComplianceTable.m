function tgt = getMdlRefComplianceTable(hObj, type)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if strcmp(type, 'RTW')
        tgt.GenerateFullHeader = {[2.0],''};
        tgt.IsPILTarget = {[2.0],''};
        tgt.IsERTTarget = {[2.0],''};
        tgt.ModelReferenceCompliant = {[0.0],'invalid',{'on'}};
        tgt.RSIM_SOLVER_SELECTION = {[2.0],''};
        tgt.PCMatlabRoot = {[2.0],''};
        tgt.ExtMode = {[1.0],'not supported',{'off'}};
        tgt.ExtModeTransport = {[2.0],''};
        tgt.ExtModeStaticAlloc = {[2.0],''};
        tgt.ExtModeStaticAllocSize = {[2.0],''};
        tgt.ExtModeTesting = {[2.0],''};
        tgt.ExtModeMexFile = {[2.0],''};
        tgt.ExtModeMexArgs = {[2.0],''};
        tgt.ExtModeIntrfLevel = {[2.0],''};
        tgt.RSIM_PARAMETER_LOADING = {[1.0],'not supported',{'off'}};
    else
        tgt = [];
    end % if
end % function
