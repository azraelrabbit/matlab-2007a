function [copySuccess, errMsg] = rtw_copy_file(src, dst)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if ispc
        [s, r] = dos(horzcat('copy "', src, '" "', dst, '"'));
    else
        [s, r] = unix(horzcat('\cp "', src, '" "', dst, '"'));
    end % if
    % 11 12
    copySuccess = exist(dst, 'file');
    errMsg = '';
    if not(copySuccess)
        errMsg = sprintf('copying %s to %s failed: %s', src, dst, r);
    end % if
end % function
