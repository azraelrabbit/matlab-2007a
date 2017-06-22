function tgt = getMdlRefComplianceTable(hObj, type)
    % 1 32
    % 2 32
    % 3 32
    % 4 32
    % 5 32
    % 6 32
    % 7 32
    % 8 32
    % 9 32
    % 10 32
    % 11 32
    % 12 32
    % 13 32
    % 14 32
    % 15 32
    % 16 32
    % 17 32
    % 18 32
    % 19 32
    % 20 32
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    if strcmp(type, 'RTW')
        tgt.GenerateFullHeader = {[2.0],''};
        tgt.IsPILTarget = {[2.0],''};
        tgt.IsERTTarget = {[2.0],''};
        tgt.ModelReferenceCompliant = {[0.0],'invalid',{'on'}};
        tgt.IncludeMdlTerminateFcn = {[2.0],''};
        tgt.CombineOutputUpdateFcns = {[2.0],''};
        tgt.InsertBlockDesc = {[2.0],''};
        tgt.GenerateErtSFunction = {[1.0],'not applicable',{'off'}};
        tgt.GenerateASAP2 = {[1.0],'not supported',{'off'}};
        tgt.ExtMode = {[1.0],'not supported',{'off'}};
        tgt.ExtModeTransport = {[2.0],''};
        tgt.ExtModeStaticAlloc = {[2.0],''};
        tgt.ExtModeStaticAllocSize = {[2.0],''};
        tgt.ExtModeTesting = {[2.0],''};
        tgt.ExtModeMexFile = {[2.0],''};
        tgt.ExtModeMexArgs = {[2.0],''};
        tgt.ExtModeIntrfLevel = {[2.0],''};
        tgt.InlinedParameterPlacement = {[2.0],''};
        tgt.TargetOS = {[2.0],''};
        tgt.MultiInstanceErrorCode = {[2.0],''};
        tgt.SuppressErrorStatus = {[2.0],''};
        tgt.GenFloatMathFcnCalls = {[2.0],''};
        tgt.RateGroupingCode = {[2.0],''};
        tgt.RootIOFormat = {[2.0],''};
        tgt.RTWCAPISignals = {[2.0],''};
        tgt.RTWCAPIParams = {[2.0],''};
        tgt.RTWCAPIStates = {[2.0],''};
        tgt.GRTInterface = {[1.0],'not supported',{'off'}};
    else
        tgt = [];
    end % if
end % function
