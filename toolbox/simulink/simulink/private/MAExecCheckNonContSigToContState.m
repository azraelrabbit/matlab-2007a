function result = MAExecCheckNonContSigToContState(system)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    result = [];
    passString = horzcat('<p><font color="#008000">', DAStudio.message('Simulink:tools:MAPassedMsg'), '</font>');
    model = bdroot(system);
    hScope = get_param(system, 'Handle');
    hModel = get_param(model, 'Handle');
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 17 19
    if eq(hScope, hModel)
        try
            evalc(horzcat(model, '(''init'');'));
            troublespots = feval(model, 'get', 'discDerivSig');
            feval(model, 'term');
        catch
            result = cellhorzcat(DAStudio.message('Simulink:tools:MAMsgCouldNotCompileModel', model));
            mdladvObj.setCheckResultStatus(false);
            return;
        end % try
        % 28 30
        if length(troublespots)
            nl = sprintf('\n');
            result = DAStudio.message('Simulink:tools:MAMsgNonContSigDerivPort');
            % 32 34
            result = horzcat(result, nl, '<table border=1, cellpadding=2>', DAStudio.message('Simulink:tools:MAMsgContSrcLocationHeader'));
            for i=1.0:length(troublespots)
                mangledname = modeladvisorprivate('HTMLjsencode', troublespots(i).block, 'encode');
                mangledname = horzcat(mangledname{:});
                dispname = regexprep(troublespots(i).block, nl, ' ');
                result = horzcat(result, DAStudio.message('Simulink:tools:MAMsgContSrcLocation', mangledname, dispname, troublespots(i).port, troublespots(i).idx, troublespots(i).width));
            end % for
            % 40 42
            result = horzcat(result, '</table>', nl, DAStudio.message('Simulink:tools:MAMsgNonContSigDerivPortSuggest'));
            mdladvObj.setCheckResultStatus(false);
        else
            result = passString;
            mdladvObj.setCheckResultStatus(true);
        end % if
    else
        result = passString;
        mdladvObj.setCheckResultStatus(true);
    end % if
    result = cellhorzcat(result);
