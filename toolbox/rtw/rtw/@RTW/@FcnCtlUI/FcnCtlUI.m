function h = FcnCtlUI(fclass)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h = RTW.FcnCtlUI;
    h.fcnclass = fclass;
    % 8 10
    if strcmp(class(fclass), 'RTW.FcnDefault')
        h.preFunctionClass = 0.0;
    else
        if strcmp(class(fclass), 'RTW.ModelSpecificCPrototype')
            h.preFunctionClass = 1.0;
        end
    end
    h.validationStatus = 1.0;
    h.validationResult = DAStudio.message('RTW:fcnClass:pressValidate');
end
