function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    pkg = findpackage('rpt_xml');
    % 12 13
    h = schema.class(pkg, 'db_locale');
    % 14 16
    % 15 16
    p = rptgen.makeProp(h, 'Language', rpt_xml.typeLanguage, 'auto', xlate('Language'));
end % function
