function privatedeletefile(filename)
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
    recycle_status = recycle;
    % 13 15
    % 14 15
    recycle('off');
    delete(filename);
    % 17 19
    % 18 19
    recycle(recycle_status);
end % function
