function disp(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.BlockDB))
        numBlocks = length(fieldnames(this.BlockDB));
        numImpls = length(fieldnames(this.DescriptionDB));
    else
        numBlocks = 0.0;
        numImpls = 0.0;
    end % if
    % 14 15
    disp(sprintf('    NumberOfSupportedBlocks: %d', numBlocks));
    disp(sprintf('    NumberOfImplementations: %d', numImpls));
    disp(' ');
end % function
