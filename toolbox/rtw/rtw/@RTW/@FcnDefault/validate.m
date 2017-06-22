function [status, msg] = validate(hSrc, hDlg, modelName, fromBuild)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    status = 1.0;
    msg = '';
    % 8 10
    if eq(slfeature('GenCustomStepWrapper'), 0.0)
        return
    end
    % 12 14
    hModel = hSrc.ModelHandle;
    % 14 16
    if isempty(hModel) || eq(hModel, 0.0)
        hModel = modelName;
    end
    % 18 20
    if hSrc.RightClickBuild
        hModel = bdroot(hSrc.SubsysBlockHdl);
        % 21 24
        % 22 24
        modelToCompile = hSrc.ModelHandle;
    else
        % 25 27
        modelToCompile = hModel;
    end
    % 28 31
    % 29 31
    cs = getActiveConfigSet(hModel);
    commitBuild = slprivate('checkSimPrm', cs);
    if not(commitBuild)
        msg = 'Validation canceled';
        return
    end
    % 36 39
    % 37 39
    try
        lastWarnSaved = lastwarn;
        lastwarn('');
        [T, compileResult] = evalc(horzcat(getfullname(modelToCompile), '([], [], [], ''compile'');'));
        if not(isempty(lastwarn))
            disp(horzcat(DAStudio.message('RTW:fcnClass:fcnProtoCtlWarn'), lastwarn));
        end
        lastwarn(lastWarnSaved);
    catch
        msg = DAStudio.message('RTW:fcnClass:modelNotCompile', lasterr);
        % 48 50
        return
    end % try
    % 51 54
    % 52 54
    saved = feature('EngineInterface');
    feature('EngineInterface', 1.0);
    uddobj = get_param(modelToCompile, 'UDDObject');
    singleRate = uddobj.isSingleRate();
    feature('EngineInterface', saved);
    % 58 60
    cs = getActiveConfigSet(hModel);
    % 60 62
    if strcmp(get_param(cs, 'CombineOutputUpdateFcns'), 'off')
        msg = DAStudio.message('RTW:fcnClass:combineOutputUpdate');
    else
        if strcmp(get_param(cs, 'MultiInstanceERTCode'), 'on')
            msg = DAStudio.message('RTW:fcnClass:reusableCode');
        else
            if strcmp(get_param(cs, 'SolverType'), 'Variable-step')
                msg = DAStudio.message('RTW:fcnClass:variableStepType');
            else
                if not(singleRate) && not(strcmp(get_param(cs, 'SolverMode'), 'SingleTasking'))
                    msg = DAStudio.message('RTW:fcnClass:singleTasking');
                end
            end
        end
    end
    hSrc.Multirate = not(singleRate);
    eval(horzcat(getfullname(modelToCompile), '([], [], [], ''term'');'));
end
