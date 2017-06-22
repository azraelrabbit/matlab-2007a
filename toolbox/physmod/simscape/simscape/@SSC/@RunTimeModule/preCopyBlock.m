function preCopyBlock(this, hBlock)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent ssc_get_configset;
    if isempty(ssc_get_configset)
        ssc_get_configset = ssc_private('ssc_get_configset');
    end
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    platformCC = ssc_get_configset(hBlock);
    % 19 21
    this.addBlock(hBlock, false);
end
