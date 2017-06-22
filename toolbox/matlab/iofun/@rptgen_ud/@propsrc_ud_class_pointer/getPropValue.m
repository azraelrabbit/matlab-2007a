function [pValue, propName] = getPropValue(psUD, objList, propName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    cls = rptgen.safeGet(objList, 'ClassPointer');
    cls = horzcat(cls{:});
    % 11 13
    psClass = rptgen_ud.propsrc_ud_class;
    id = getPropValue(psClass, cls, PropName);
