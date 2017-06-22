function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'crg_halt_gen', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'isPrompt', 'bool', logical(0), xlate('Confirm before stopping generation'));
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.makeProp(h, 'PromptString', 'string', xlate('Stop generating the report?'), xlate('Confirmation question'));
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.makeProp(h, 'HaltString', 'string', xlate('Halt Generation'), xlate('Halt button name'));
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.makeProp(h, 'ContString', 'string', xlate('Continue Generation'), xlate('Continue button name'));
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    rptgen.makeStaticMethods(h, {}, {});
    % 34 36
end
