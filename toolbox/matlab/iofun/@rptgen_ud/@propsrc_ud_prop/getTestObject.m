function to = getTestObject(ps, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    ch = classhandle(ps);
    ch2 = classhandle(ch);
    to = horzcat(ch2.Properties(1.0), ch2);
end % function
