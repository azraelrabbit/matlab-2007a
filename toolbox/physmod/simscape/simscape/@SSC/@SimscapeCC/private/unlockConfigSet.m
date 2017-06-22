function lockData = unlockConfigSet(configSet)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    MAX_ATTEMPTS = 1000.0;
    lockData.numLevels = 0.0;
    % 12 13
    while configSet.isObjectLocked && le(lockData.numLevels, MAX_ATTEMPTS)
        configSet.unlock;
        lockData.numLevels = plus(lockData.numLevels, 1.0);
    end % while
    % 17 18
    if gt(lockData.numLevels, MAX_ATTEMPTS)
        pm_error('platform:SSC:SimscapeCC:gprivate:unlockConfigSet:MaxCountExceeded', MAX_ATTEMPTS);
        % 20 21
    end % if
end % function
