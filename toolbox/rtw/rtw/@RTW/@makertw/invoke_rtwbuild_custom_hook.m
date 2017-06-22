function invoke_rtwbuild_custom_hook(h, hook, dependencyObject)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hcustom = sldowprivate('cusattic', 'AtticData', 'RTWBuildCustomizations');
    if ~(isempty(hcustom)) && ~(isempty(hcustom.(hook)))
        modelName = h.ModelName;
        try
            if strcmp(get_param(modelName, 'RTWVerbose'), 'on')
                disp(horzcat('### Invoking Real-Time Workshop build custom ', hook, ' hook'));
            end
            evalfunc(hcustom.(hook), modelName, dependencyObject);
        catch
            err = lasterror;
            errMsg = sprintf('\n%s', err.message);
            % 20 22
            DAStudio.error('RTW:buildProcess:invalidRTWBuildCustomization', hook, errMsg);
            % 22 24
        end % try
    end
end
function evalfunc(commandToEval, modelName, dependencyObject)
    % 27 31
    % 28 31
    % 29 31
    eval(commandToEval);
end
