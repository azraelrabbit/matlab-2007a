function dispSupportedBlocks(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    blocks = this.getSupportedBlocks;
    % 10 12
    % 11 12
    blocks = regexprep(blocks, '\n', ' ');
    % 13 14
    disp(' ')
    disp('Supported blocks:')
    disp(' ')
    disp(blocks)
end % function
