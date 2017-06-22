function tList = pt_getPresetTableList(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch lower(c.ObjectType)
    case 'model'
        tList = {'Simulation Parameters';'Version Information';'RTW Information'};
        % 11 17
        % 12 17
        % 13 17
        % 14 17
        % 15 17
        if strcmp(get_param(0.0, 'RtwLicensed'), 'on')
            tList{plus(end, 1.0)} = 'Summary (req. RTW)';
        end % if
    case 'system'
        % 20 22
        tList = {'Mask Properties';'System Signals';'Print Properties'};
        % 23 25
    case 'block'
        % 24 26
        tList = {'Block Signals';'Mask Properties'};
    case 'annotation'
        % 27 29
        tList = {};
    case 'configset'
        tList = {};
    case 'signal'
        tList = {'Complete';'Compiled Information'};
    otherwise
        % 34 36
        tList = {};
    end % switch
    % 37 39
    tList = vertcat({'Default'}, tList, {'Blank 4x4'});
