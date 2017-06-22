function msg = des_error_redirect(blk, id)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    slerr = sllasterror;
    msg = slerr.Message;
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    blockfullpath = getfullname(blk);
    str = strcat('Error in', ' ''', blockfullpath, '''', ' block.');
    msg = regexprep(msg, str, '');
end % function
