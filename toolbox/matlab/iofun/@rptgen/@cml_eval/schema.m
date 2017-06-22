function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen');
    % 10 11
    h = schema.class(pkg, 'cml_eval', pkg.findclass('rptcomponent'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = rptgen.makeProp(h, 'EvalString', 'string', sprintf('%%Evaluate this string in the base workspace\n\n'), xlate('Expression to evaluate in the base workspace:'));
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = rptgen.makeProp(h, 'isCatch', 'bool', true, xlate('Evaluate this expression if there is an error:'));
    % 23 26
    % 24 26
    % 25 26
    p = rptgen.makeProp(h, 'CatchString', 'string', sprintf('rptgen.displayMessage(sprintf(''%s: %%s'',lasterr),2);\n%%rptgen.displayMessage(''%s'',2);rptgen.haltGenerate;', xlate('Error during eval'), xlate('Halting generation')), '');
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    p = rptgen.makeProp(h, 'isDiary', 'bool', true, xlate('Display command window output in report'));
    % 35 38
    % 36 38
    % 37 38
    p = rptgen.makeProp(h, 'isInsertString', 'bool', true, xlate('Insert MATLAB expression in report'));
    % 39 42
    % 40 42
    % 41 42
    rptgen.makeStaticMethods(h, {}, {});
    % 43 44
end % function
