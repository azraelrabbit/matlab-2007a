function i = summ_getDefaultTypeInfo(typeID)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    switch typeID
    case 'package'
        i = rptgen.summsrc(typeID, rptgen_ud.propsrc_ud_pkg, rptgen_ud.cud_pkg_loop, {'name','Classes'}, true);
        % 13 17
        % 14 17
        % 15 17
    case 'object'
        % 16 18
        i = rptgen.summsrc(typeID, rptgen_ud.propsrc_ud_obj, rptgen_ud.cud_obj_loop, {'(class)','(all properties)'}, true);
        % 19 23
        % 20 23
        % 21 23
    case 'class'
        % 22 24
        i = rptgen.summsrc('class', rptgen_ud.propsrc_ud_class, rptgen_ud.cud_class_loop, {'Name','Description'}, true);
        % 25 29
        % 26 29
        % 27 29
    case 'method'
        % 28 30
        i = rptgen.summsrc('method', rptgen_ud.propsrc_ud_method, rptgen_ud.cud_method_loop('LocalMethodsOnly', true), {'Name'}, true);
        % 31 35
        % 32 35
        % 33 35
    case 'property'
        % 34 36
        i = rptgen.summsrc('property', rptgen_ud.propsrc_ud_prop, rptgen_ud.cud_prop_loop, {'Name','DataType'}, true);
    otherwise
        % 37 41
        % 38 41
        % 39 41
        % 40 42
        error('rptgen:InvalidSummsrc', 'Unrecognized summsrc type "%s"', typeID);
    end % switch
