function msg = des_solver_error_redirect(blk, id)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    slerr = sllasterror;
    msg = slerr.Message;
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    blockfullpath = getfullname(blk);
    str = strcat('Error in', ' ''', blockfullpath, '''', ' block.');
    msg = regexprep(msg, str, '');
    msg = strcat('Error in SimEvents solver :', msg);
end % function
