function fileName = save(slwebview_v1, fileName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    save(fileName, 'slwebview_v1', '-mat');
    % 9 12
    % 10 12
    % 11 12
    slwebview_v1.setDirty(false);
end % function
