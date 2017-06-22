function dialogCallback(hObj, hDlg, tag, action)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ObjProp = tag(plus(length('ConfigSet_HDLCoder_MainPanel_'), 1.0):end);
    setting_unchanged = true;
    % 10 12
    [hdriver, mdlName] = getDriver(hObj);
    slsfnagctlr('ClearSimulation', get_param(mdlName, 'name'), 'HDL Coder');
    try
        setting_unchanged = feval(horzcat(ObjProp, '_callback'), hObj, hDlg, tag, action);
    catch
        hdlcoderui.nagctlr;
    end % try
    slsfnagctlr('ViewSimulation');
    % 19 21
    if isequal(action, 'enableApply') && eq(setting_unchanged, false)
        EnableApplyButton(hDlg);
    end % if
function unchanged_flag = Generate_callback(hObj, hDlg, tag, action)
    % 24 28
    % 25 28
    % 26 28
    hdriver = getDriver(hObj);
    unchanged_flag = true;
    % 29 32
    % 30 32
    commitBuild = slprivate('checkSimPrm', hObj.getSourceObject.getConfigSet);
    if commitBuild && ishandle(hObj)
        hdriver.makehdl;
    end % if
function unchanged_flag = CheckHDL_callback(hObj, hDlg, tag, action)
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    hdriver = getDriver(hObj);
    unchanged_flag = true;
    % 42 45
    % 43 45
    commitBuild = slprivate('checkSimPrm', hObj.getSourceObject.getConfigSet);
    if commitBuild && ishandle(hObj)
        hdriver.checkhdl;
    end % if
function unchanged_flag = SaveCFGFile_callback(hObj, hDlg, tag, action)
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    unchanged_flag = true;
    hdriver = getDriver(hObj);
    % 55 57
    commitBuild = slprivate('checkSimPrm', hObj.getSourceObject.getConfigSet);
    if commitBuild && ishandle(hObj)
        [file, path] = uiputfile('*.m', 'Save to control file', hObj.HDLConfigFileStr);
        if ne(file, 0.0)
            hdriver.saveConfigFile(horzcat(path, file));
            % 61 63
            set(hObj, 'HDLConfigFileStr', horzcat(path, file));
            unchanged_flag = false;
        end % if
    end % if
function unchanged_flag = LoadCFGFile_callback(hObj, hDlg, tag, action)
    % 67 71
    % 68 71
    % 69 71
    unchanged_flag = true;
    [file, path] = uigetfile('*.m', 'Select control file');
    if ne(file, 0.0)
        hdriver = getDriver(hObj);
        lastwarn('');
        hdriver.loadConfigfiles(cellhorzcat(horzcat(path, file)));
        if isempty(lastwarn)
            % 77 79
            set(hObj, 'HDLConfigFileStr', horzcat(path, file));
            unchanged_flag = false;
        else
            % 81 84
            % 82 84
            hdlcoderui.nagctlr('Warning');
            % 84 86
        end % if
    end % if
function unchanged_flag = Browse_callback(hObj, hDlg, tag, action)
    % 88 92
    % 89 92
    % 90 92
    hdlcc = gethdlcconfigset(hObj.getSourceObject.getConfigSet);
    unchanged_flag = true;
    tdir = uigetdir('', 'Select Target Directory');
    if ne(tdir, 0.0)
        hCLI = hdlcc.HDLCoder.CoderParameterObject.CLI;
        set(hCLI, 'TargetDirectory', tdir);
        unchanged_flag = false;
    end % if
function unchanged_flag = Default_callback(hObj, hDlg, tag, action)
    % 100 104
    % 101 104
    % 102 104
    [hdriver, mdlName] = getDriver(hObj);
    unchanged_flag = true;
    % 105 107
    str = 'Restore Factory Defaults will reset all HDL code generation settings. This action cannot be cancelled or undone. To recover previous settings, you must close the model without saving and reopen it. Do you want to continue?';
    % 107 109
    answer = questdlg(str, 'Restore Factory Defaults', 'Yes', 'No', 'No');
    if strcmp(answer, 'Yes')
        unchanged_flag = false;
        set_param(mdlName, 'HDLConfigFile', {' '});
        hObj.HDLConfigFileStr = '';
        hdriver.resetAll(mdlName);
    end % if
function EnableApplyButton(hDlg)
    % 116 120
    % 117 120
    % 118 120
    if not(isempty(hDlg)) && isa(hDlg, 'DAStudio.Dialog')
        hDlg.enableApplyButton(true);
    end % if
function [hdriver, mdlName] = getDriver(hObj)
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    hSrc = hObj.getSourceObject;
    hModel = getModel(hSrc);
    hdriver = get_param(hModel, 'HDLCoder');
    mdlName = get_param(hModel, 'Name');
