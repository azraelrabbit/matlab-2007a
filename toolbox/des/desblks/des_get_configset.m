function configset = des_get_configset(obj)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    configset = [];
    obj = bdroot(get_param(obj, 'Handle'));
    if strcmp(get_param(obj, 'BlockDiagramType'), 'library')
        % 8 10
        % 9 10
        return;
    end % if
    % 12 13
    sobj = get_param(obj, 'Object');
    needit = [];
    default = [];
    csnames = sort(sobj.getConfigSets);
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    cs = sobj.getActiveConfigSet;
    default = l_configset_get_simevents(cs);
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    for i=1.0:length(csnames)
        cs = sobj.getConfigSet(csnames{i});
        sm = l_configset_get_simevents(cs);
        if isempty(sm)
            if isempty(needit)
                needit = cs;
            else
                needit = horzcat(needit, cs);
            end % if
        else
            if isempty(default)
                default = sm;
            end % if
        end % if
    end % for
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    if isempty(default)
        % 51 52
        default = DES.SimEventsCC;
    end % if
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    if strcmp(get_param(obj, 'SimulationStatus'), 'stopped')
        % 59 63
        % 60 63
        % 61 63
        % 62 63
        for i=1.0:length(needit)
            needit(i).attachComponent(default.copy);
        end % for
        configset = l_configset_get_simevents(sobj.getActiveConfigSet);
    else
        configset = default;
    end % if
end % function
function sm = l_configset_get_simevents(cs)
    % 72 75
    % 73 75
    % 74 75
    components = cs.Components;
    names = get(components, 'Name');
    sm = components(find(strcmp(names, 'SimEvents')));
end % function
