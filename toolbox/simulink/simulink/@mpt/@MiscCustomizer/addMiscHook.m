function addMiscHook(hThisObj, hook, commandString)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(isprop(hThisObj, 'MPFToolVersion'))
        persistent diswarn;
        if isempty(diswarn)
            warning('Simulink:mpt:MiscCustomizer:addMiscHook', 'addMiscHook for ''MPFToolVersion'' requires Real-Time Workshop Embedded Coder installed.');
            % 11 13
            diswarn = 1.0;
        end
        return
    end
    % 16 18
    if isprop(hThisObj, hook)
        hThisObj.(hook) = commandString;
    else
        warning('Simulink:mpt:MiscCustomizer:addMiscHook', sprintf('Invalid hook ''%s'' for addMiscHook.', hook));
    end
end
