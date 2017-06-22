function hObj = invoke(hThis, fullClassNameStr, hBlk)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hObj = feval(fullClsNameStr, hBlk);
end % function
