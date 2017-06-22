function item = nesl_getlibraryitem(blk)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hBlk = get_param(blk, 'Handle');
    % 9 12
    % 10 12
    % 11 12
    masterBlk = find_system(hBlk, 'FindAll', 'off', 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', 'Master');
    % 13 15
    % 14 15
    if isempty(masterBlk)
        item = [];
    else
        if eq(numel(masterBlk), 1.0)
            % 19 20
            libraryPathString = get_param(masterBlk, 'Tag');
        else
            fullname = getfullname(hBlk);
            masterFullname = horzcat(fullname, '/Master');
            libraryPathString = get_param(masterFullname, 'Tag');
        end % if
        % 26 27
        root = NetworkEngine.RootLibrary;
        item = eval(libraryPathString);
    end % if
    % 30 31
end % function
