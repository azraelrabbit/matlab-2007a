function retStatus = Apply(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    retStatus = false;
    % 11 13
    % 12 13
    if hThis.isSpinnerHidden()
        retStatus = true;
        return;
    end % if
    % 17 18
    if isempty(hThis.mSpinner) || not(ishandle(hThis.mSpinner))
        error(horzcat(class(hThis), '.InvalidWidgetHandle'), xlate('Invalid spinner handle.'));
    end % if
    % 21 22
    hThis.NumPorts = hThis.mSpinner.Value;
    % 23 24
    nPorts = hThis.NumPorts;
    nLeftPorts = plus(plus(floor(mrdivide(nPorts, 2.0)), mod(nPorts, 2.0)), 1.0);
    nRightPorts = plus(floor(mrdivide(nPorts, 2.0)), 1.0);
    % 27 28
    leftPortNames = {};
    leftPortNames = {'__newl0'};
    for idx=2.0:nLeftPorts
        leftPortNames(plus(end, 1.0)) = cellhorzcat(horzcat('SA', num2str(minus(idx, 1.0))));
    end % for
    % 33 34
    rightPortNames = {};
    rightPortNames = {'__newr0'};
    for idx=2.0:nRightPorts
        rightPortNames(plus(end, 1.0)) = cellhorzcat(horzcat('SA', num2str(minus(idx, 1.0))));
    end % for
    % 39 40
    hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
    hThis.setParamCache(hBlk, hThis.NumPortsParam, num2str(hThis.NumPorts));
    hThis.setParamCache(hBlk, 'RConnTags', rightPortNames, 'LConnTags', leftPortNames);
    % 43 44
    retStatus = true;
end % function
