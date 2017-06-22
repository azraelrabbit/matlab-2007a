function targetList = mech_support_nbrListener(targetList)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    persistent stored_target_list;
    mlock
    % 13 15
    if gt(nargin, 0.0)
        stored_target_list = targetList;
    else
        targetList = stored_target_list;
    end
end
