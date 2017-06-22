function n = getName(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        objType = this.loop_getObjectType;
    catch
        objType = xlate('Unknown');
    end % try
    % 13 14
    n = horzcat(objType, xlate(' Loop'));
end % function
