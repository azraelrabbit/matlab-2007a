function hNewObj = createInstance(hThis, fullClsNameStr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hNewObj = 0.0;
    if isempty(hThis.CreateInstanceFcn)
        error('PmGuiObj Object is missing a CreateInstanceFcn object handle.');
        return;
    end % if
    % 12 13
    hNewObj = hThis.CreateInstanceFcn.invoke(fullClsNameStr, hThis.BlockHandle);
end % function
