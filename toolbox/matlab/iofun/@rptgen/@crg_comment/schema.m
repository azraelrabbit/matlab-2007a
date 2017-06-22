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
    h = schema.class(pkg, 'crg_comment', pkgRG.findclass('rptcomponent'));
    % 12 16
    % 13 16
    % 14 16
    p = rptgen.makeProp(h, 'CommentText', rptgen.makeStringType, '', xlate('Comment text'));
    % 16 20
    % 17 20
    % 18 20
    p = rptgen.makeProp(h, 'isDisplayComment', 'bool', logical(0), xlate('Show comment in Generation Status window'));
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.makeProp(h, 'CommentStatusLevel', vertcat(cellhorzcat('1', xlate('1) Error messages only')), cellhorzcat('2', xlate('2) Warning messages')), cellhorzcat('3', xlate('3) Important messages ')), cellhorzcat('4', xlate('4) Standard messages ')), cellhorzcat('5', xlate('5) Low-level messages ')), cellhorzcat('6', xlate('6) All messages'))), '4', xlate('Status message priority level'));
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    rptgen.makeStaticMethods(h, {}, {'getChildContentTypes'});
    % 35 38
    % 36 38
end
