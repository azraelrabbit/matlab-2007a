function sl_internal_customization(cm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hObj_sldo = mpt.SLDataObjectCustomizer;
    hObj_build = mpt.RTWBuildCustomizer;
    hObj_misc = mpt.MiscCustomizer;
    % 11 12
    cm.addCustomizer('slDataObjectCustomizer', hObj_sldo);
    cm.addCustomizer('RTWBuildCustomizer', hObj_build);
    cm.addCustomizer('miscCustomizer', hObj_misc);
    % 15 16
    cusattic('AtticData', 'slDataObjectCustomizations', hObj_sldo);
    cusattic('AtticData', 'RTWBuildCustomizations', hObj_build);
    cusattic('AtticData', 'miscCustomizations', hObj_misc);
end % function
