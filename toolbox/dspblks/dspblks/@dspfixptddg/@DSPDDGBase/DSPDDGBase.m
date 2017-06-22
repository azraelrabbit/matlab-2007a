function this = DSPDDGBase(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = dspfixptddg.DSPDDGBase(block);
    % 10 11
    this.init(block);
end % function
