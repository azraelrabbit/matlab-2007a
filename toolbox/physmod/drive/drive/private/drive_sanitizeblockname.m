function name = drive_sanitizeblockname(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    block = get_param(block, 'Handle');
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    top = block;
    libblk = drive_getlibraryblock(block, drivelib);
    % 22 26
    % 23 26
    % 24 26
    % 25 26
        while ne(libblk, -1.0)
        top = libblk;
        libblk = drive_getlibraryblock(libblk, drivelib);
    end % while
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    name = getfullname(top);
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    name = regexprep(name, '\n+', ' ');
end % function
