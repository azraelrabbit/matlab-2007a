function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('RptgenML');
    % 10 11
    clsH = schema.class(pkg, 'StylesheetElementID', pkg.findclass('StylesheetElement'));
    % 12 15
    % 13 15
    % 14 15
    p = rptgen.prop(clsH, 'ID', 'string');
    p.Description = xlate('Attribute');
    % 17 18
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @getID;
    p.setFunction = @setID;
    % 23 25
    % 24 25
    m = schema.method(clsH, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
function returnedValue = getID(this, storedValue)
    % 32 35
    % 33 35
    % 34 35
    returnedValue = ut_getID(this, storedValue);
end % function
function valueStored = setID(this, proposedValue)
    % 38 41
    % 39 41
    % 40 41
    valueStored = ut_setID(this, proposedValue);
end % function
