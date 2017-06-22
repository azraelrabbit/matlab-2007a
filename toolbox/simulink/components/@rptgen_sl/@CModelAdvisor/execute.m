function out = execute(thisComp, parentDoc, varargin)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    out = [];
    adSL = rptgen_sl.appdata_sl;
    switch lower(adSL.Context)
    case {'','model','none'}
        currObj = adSL.CurrentModel;
    case {'system'}
        currObj = adSL.CurrentSystem;
    otherwise
        % 30 32
        return
    end
    % 33 35
    mdlObj = get_param(bdroot(currObj), 'Object');
    mdladvObject = mdlObj.getModelAdvisorObj;
    if ~(thisComp.ReuseReport && Simulink.ModelAdvisor.reportExists(currObj))
        mdladvObject.init(currObj);
        mdladvObject.selectCheckAll;
        mdladvObject.runCheck;
    end
    origSystem = mdladvObject.System;
    mdladvObject.System = currObj;
    % 43 45
    adRG = rptgen.appdata_rg;
    maFile = adRG.getImgName('html', 'ModelAdvisor');
    mdladvObject.exportReport(maFile.fullname);
    mdladvObject.System = origSystem;
    % 48 50
    try
        out = com.mathworks.toolbox.rptgencore.docbook.FileImporter.importExternalFile(maFile.relname, java(parentDoc), 'Model Advisor');
        % 51 55
        % 52 55
        % 53 55
        adRG.PostConvertImport = true;
    catch
        % 56 58
        status(this, sprintf('Could not import model advisor report for "%s"', currObj), 2.0);
        status(this, lasterr, 5.0, 0.0);
    end % try
end
