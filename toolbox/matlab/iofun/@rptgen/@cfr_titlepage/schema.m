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
    h = schema.class(pkg, 'cfr_titlepage', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.makeProp(h, 'Title', rptgen.makeStringType, '', xlate('Title'));
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.makeProp(h, 'Subtitle', rptgen.makeStringType, '', xlate('Subtitle'), 1.0);
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.makeProp(h, 'AuthorMode', vertcat(cellhorzcat('none', xlate('No author')), cellhorzcat('auto', xlate('Automatic author')), cellhorzcat('manual', xlate('Custom author: '))), 'manual', '');
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    try
        defaultName = char(java.lang.System.getProperty('user.name'));
    catch
        defaultName = '';
    end % try
    % 34 36
    p = rptgen.makeProp(h, 'Author', rptgen.makeStringType, defaultName);
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.makeProp(h, 'Include_Date', 'bool', true, xlate('Include report creation date'));
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.makeProp(h, 'DateFormat', 'String', 'dd-mmm-yyyy HH:MM:SS', '');
    % 45 49
    % 46 49
    % 47 49
    p = rptgen.makeProp(h, 'Include_Copyright', 'bool', false, xlate('Include copyright holder and year'));
    % 49 53
    % 50 53
    % 51 53
    p = rptgen.makeProp(h, 'Copyright_Holder', rptgen.makeStringType, '');
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    p = rptgen.makeProp(h, 'Copyright_Date', rptgen.makeStringType, '');
    % 58 62
    % 59 62
    % 60 62
    csDataType = 'RGComponentOrParsedString';
    if isempty(findtype(csDataType))
        schema.UserType(csDataType, 'MATLAB array', @checkComponentOrString);
        % 64 67
        % 65 67
    end % if
    % 67 71
    % 68 71
    % 69 71
    p = rptgen.makeProp(h, 'Abstract', rptgen.makeStringType, '', xlate('Abstract'));
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    p = rptgen.makeProp(h, 'Legal_Notice', rptgen.makeStringType, '', xlate('Legal notice'));
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    p = rptgen.makeProp(h, 'Image', csDataType, '', xlate('Image file name'));
    % 82 86
    % 83 86
    % 84 86
    rptgen.makeStaticMethods(h, {}, {'doCopy'});
    % 86 89
    % 87 89
function ok = checkComponentOrString(inValue)
    % 89 97
    % 90 97
    % 91 97
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    ok = or(or(ischar(inValue), isa(inValue, 'rptgen.rptcomponent')), isempty(inValue));
