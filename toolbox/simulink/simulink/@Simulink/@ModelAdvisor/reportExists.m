function output = reportExists(SystemName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    output = false;
    if lt(nargin, 1.0)
        error('Please specify the name of system.');
    end % if
    this = Simulink.ModelAdvisor;
    if ischar(SystemName)
        % 13 14
        SystemName = fliplr(SystemName);
        if strncmpi(SystemName, 'ldm.', 4.0)
            SystemName = SystemName(5.0:end);
        end % if
        SystemName = fliplr(SystemName);
    end % if
    try
        origSystem = this.System;
        this.System = SystemName;
        report = horzcat(this.getWorkDir('CheckOnly'), filesep, 'model_diagnose.html');
        this.System = origSystem;
        output = eq(exist(report, 'file'), 2.0);
    catch
        this.System = origSystem;
        output = false;
    end % try
end % function
