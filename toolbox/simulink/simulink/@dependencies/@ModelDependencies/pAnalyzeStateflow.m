function [filerefs, filestates, includedirs] = pAnalyzeStateflow(obj, mdlname)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    filerefs = [];
    filestates = [];
    includedirs = [];
    % 18 20
    % 19 20
    return;
    % 21 23
    % 22 23
    machine = find(sfroot, '-isa', 'Stateflow.Machine', 'Path', mdlname);
    if isempty(machine)
        return;
    end % if
    % 27 29
    % 28 29
    calls2ml = [];
    charts = [];
    transitions = find(sfroot, '-isa', 'Stateflow.Transition', 'Machine', machine);
    % 32 34
    % 33 34
    for kk=1.0:numel(transitions)
        if not(isempty(findstr(transitions(kk).LabelString, 'ml.')))
            % 36 37
            calls2ml = vertcat(calls2ml, cellhorzcat(transitions(kk).LabelString));
            charts = vertcat(charts, cellhorzcat(transitions(kk).Chart.Path));
        end % if
    end % for
    % 41 45
    % 42 45
    % 43 45
    % 44 45
end % function
