function varargout = dlgGenerateFile(this, previewSys, dlgH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    this.ErrorMessage = '';
    dlgH.setTitle(xlate('Exporting...'));
    % 8 10
    oldMaskEnable = dlgH.isEnabled('LookUnderMasks');
    oldLinkEnable = dlgH.isEnabled('FollowLinks');
    oldMRefEnable = dlgH.isEnabled('FollowModelReference');
    % 12 14
    dlgH.setEnabled('SearchScope', 0.0);
    dlgH.setEnabled('LookUnderMasks', 0.0);
    dlgH.setEnabled('FollowLinks', 0.0);
    dlgH.setEnabled('ExportButton', 0.0);
    dlgH.setEnabled('FollowModelReference', 0.0);
    dlgH.setEnabled('LayerTable', 0.0);
    % 19 21
    errMsg = '';
    try
        fileNameHTML = generateFile(this, previewSys);
    catch
        fileNameHTML = '';
        errMsg = lasterr;
    end % try
    % 27 30
    % 28 30
    okGenerate = isempty(errMsg);
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    if not(dlgH.isStandAlone)
        this.ErrorMessage = errMsg;
        dlgH.refresh;
    else
        if not(okGenerate)
            dlgH.setTitle(xlate('Done - error while exporting'));
            dlgH.setEnabled('SearchScope', 1.0);
            dlgH.setEnabled('LookUnderMasks', oldMaskEnable);
            dlgH.setEnabled('FollowLinks', oldLinkEnable);
            dlgH.setEnabled('FollowModelReference', oldMRefEnable);
            dlgH.setEnabled('LayerTable', 1.0);
        end
    end
    if not(this.ViewFile) && okGenerate
        % 49 52
        % 50 52
        disp(sprintf('Simulink Web View exported to file <a href="%s">"%s"</a>.', rptgen.file2urn(fullfile(pwd, fileNameHTML)), fileNameHTML));
        % 52 54
    end
    % 54 56
    if gt(nargout, 2.0)
        varargout{3.0} = fileNameHTML;
    end
    if gt(nargout, 1.0)
        varargout{2.0} = errMsg;
    end
    if gt(nargout, 0.0)
        varargout{1.0} = okGenerate;
    end
end
