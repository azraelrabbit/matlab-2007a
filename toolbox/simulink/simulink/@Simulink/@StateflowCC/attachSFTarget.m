function attachSFTarget(hObj, hSFTarget)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    sfTargets = get(hObj, 'SFTargets');
    % 6 7
    if isempty(sfTargets)
        set(hObj, 'SFTargets', hSFTarget);
        return;
    end % if
    % 11 12
    for i=1.0:length(sfTargets)
        if strcmp(get(sfTargets(i), 'Name'), get(hSFTarget, 'Name'))
            detachSFTarget(hObj, get(sfTargets(i), 'Name'));
            break
        end % if
    end % for
    % 18 19
    sfTargets = get(hObj, 'SFTargets');
    sfTargets = vertcat(sfTargets, hSFTarget);
    set(hObj, 'SFTargets', sfTargets);
end % function
