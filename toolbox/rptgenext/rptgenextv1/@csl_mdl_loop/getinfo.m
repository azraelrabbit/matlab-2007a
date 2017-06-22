function out = getinfo(c)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    out = getprotocomp(c);
    % 19 23
    % 20 23
    % 21 23
    out.Name = xlate('Model Loop');
    out.Type = 'SL';
    out.Desc = xlate('Includes specified models and systems in report');
    out.ValidChildren = {logical(1)};
    % 26 30
    % 27 30
    % 28 30
    out.att.LoopType = 'Current';
    % 30 32
    out.att.CurrentModels = struct('isActive', logical(1), 'MdlName', '$current', 'MdlCurrSys', {{'$current'}}, 'SysLoopType', '$all', 'isMask', 'graphical', 'isLibrary', 'off');
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    out.att.AllModels = struct('isActive', logical(1), 'MdlName', '$all', 'MdlCurrSys', {{'$top'}}, 'SysLoopType', '$all', 'isMask', 'graphical', 'isLibrary', 'off');
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    out.att.CustomModels = struct('isActive', logical(1), 'MdlName', '', 'MdlCurrSys', {{'$top'}}, 'SysLoopType', '$all', 'isMask', 'graphical', 'isLibrary', 'off');
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    out.attx.LoopType.String = '';
    out.attx.LoopType.enumValues = {'Current','All','Custom'};
    out.attx.LoopType.enumNames = {'Current model';'All visible models';'Custom list of models'};
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    out.attx.LoopType.UIcontrol = 'radiobutton';
end
