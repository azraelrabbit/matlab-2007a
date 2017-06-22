function out = getConfigRTW
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    out = vertcat(cellhorzcat(xlate('Target selection - System target file'), 'SystemTargetFile'), cellhorzcat(xlate('Target selection - Language'), 'TargetLang'), cellhorzcat(xlate('Build process - TLC options'), 'TLCOptions'), cellhorzcat(xlate('Build process - Generate makefile'), 'GenerateMakefile'), cellhorzcat(xlate('Build process - Make command'), 'MakeCommand'), cellhorzcat(xlate('Build process - Template makefile'), 'TemplateMakefile'), cellhorzcat(xlate('Generate code only'), 'GenCodeOnly'));
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
