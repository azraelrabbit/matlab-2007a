function editadditionalparameters(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    [props, descs] = getbuttonprops(h);
    % 9 12
    % 10 12
    answers = get(h, props);
    if not(isa(answers, 'cell'))
        answers = cellhorzcat(answers);
    end % if
    % 15 18
    % 16 18
    newvals = inputdlg(descs, 'Set Additional Parameters', 1.0, answers);
    % 18 22
    % 19 22
    % 20 22
    if not(isempty(newvals))
        % 22 24
        if not(iscell(props))
            props = cellhorzcat(props);
        end % if
        % 26 28
        c = vertcat(cellhorzcat(props{:}), cellhorzcat(newvals{:}));
        set(h, c{:});
        % 29 32
        % 30 32
        send(h, 'UserModifiedSpecs', handle.EventData(h, 'UserModifiedSpecs'));
    end % if
end % function
