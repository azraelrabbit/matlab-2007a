function assignObjId(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    myId = uint32(mtimes(rand, intmax('uint32')));
    hThis.ObjId = sprintf('%s.%s', class(hThis), num2str(myId));
end % function
