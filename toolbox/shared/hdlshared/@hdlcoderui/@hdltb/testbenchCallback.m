function testbenchCallback(hObj, hDlg, tag, action, hTopObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hSrc = gethdlcconfigset(hDlg.getSource);
    mdlName = getModel(hSrc);
    hdriver = get_param(mdlName, 'HDLCoder');
    % 11 14
    % 12 14
    % 13 14
    slsfnagctlr('ClearSimulation', get_param(bdroot, 'name'), 'HDL Coder');
    try
        commitBuild = slprivate('checkSimPrm', hTopObj.getSourceObject.getConfigSet);
        if commitBuild && ishandle(hTopObj)
            slsfnagctlr('ClearSimulation', get_param(mdlName, 'name'), 'HDL Coder');
            % 19 21
            % 20 21
            hSrc.lock;
            try
                hdriver.makehdltb;
            catch
                hdlcoderui.nagctlr;
            end % try
            hSrc.unlock;
            slsfnagctlr('ViewSimulation');
        end % if
    catch
        hdlcoderui.nagctlr;
    end % try
    slsfnagctlr('ViewSimulation');
end % function
