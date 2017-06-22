function products = determineModelProducts(mdl)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    products = {};
    % 14 16
    this = SSC.RunTimeModule.getInstance;
    % 16 18
    isExamining = this.isExaminingModel(mdl);
    this.setExaminingModel(mdl, true);
    % 19 21
    getPmBlocksAndProducts = ssc_private('ssc_get_pm_blocks');
    [pmBlocks, flags, products] = getPmBlocksAndProducts(mdl);
    this.setExaminingModel(mdl, isExamining);
