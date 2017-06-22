function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cud_obj_hier', pkgRG.findclass('rpt_list'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'TreeType', vertcat(cellhorzcat('relative', xlate('Current object')), cellhorzcat('root', xlate('Root of current object'))), 'relative', xlate('Construct tree from'), 1.0);
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.makeProp(h, 'EmphasizeCurrent', 'bool', true, xlate('Emphasize current object in tree'), 1.0);
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.makeProp(h, 'ParentDepth', 'int32', 10.0, xlate('Show number of parents'), 1.0);
    % 26 29
    % 27 29
    p = rptgen.makeProp(h, 'ShowSiblings', 'bool', true, xlate('Show siblings'), 1.0);
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.makeProp(h, 'ChildDepth', 'int32', 5.0, xlate('Show children to depth'), 1.0);
    % 33 36
    % 34 36
    pkgRG.findclass('propsrc');
    p = rptgen.makeProp(h, 'RuntimePropSrc', 'rptgen.propsrc', [], 'Property source (runtime)', 2.0);
    % 37 40
    % 38 40
    findclass(findpackage('rpt_xml'), 'document');
    p = rptgen.makeProp(h, 'RuntimeDocument', 'rpt_xml.document', [], 'Document (parent)', 2.0);
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.makeProp(h, 'RuntimeEmphasisNode', 'handle', [], 'Node to emphasize (parent)', 2.0);
    % 45 49
    % 46 49
    % 47 49
    rptgen.makeStaticMethods(h, {}, {'hierDown';'hierGetContent';'hierGetNode';'hierGetPropSrc';'hierGetStartPoint';'hierLeft';'hierRight';'hierUp';'hierGetDialogSchema';'list_getContent'});
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
