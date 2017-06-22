function h = RegionInfo(inArray)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    h = Simulink.RegionInfo;
    % 7 8
    startIdx = inArray(1.0);
    numElements = inArray(2.0);
    % 10 12
    % 11 12
    set(h, 'StartIndex', startIdx);
    set(h, 'NumElements', numElements);
end % function
