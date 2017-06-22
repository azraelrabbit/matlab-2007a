function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkg, 'appdata_ud', pkgRG.findclass('appdata'));
    % 11 12
    p = newSchema(h, 'CurrentPackage', 'handle');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvCurrentPackage;
    % 15 16
    p = newSchema(h, 'CurrentObject', 'handle');
    % 17 18
    p = newSchema(h, 'CurrentClass', 'handle');
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvCurrentClass;
    % 21 22
    p = newSchema(h, 'CurrentProperty', 'handle vector');
    p = newSchema(h, 'CurrentMethod', 'handle vector');
    p = newSchema(h, 'Context', 'String');
    % 25 26
    p = newSchema(h, 'ClassInheritanceTable', 'MATLAB array', []);
    p.AccessFlags.AbortSet = 'off';
    p.getFunction = @gvClassInheritanceTable;
end % function
function p = newSchema(h, name, dataType, factoryValue)
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    % 39 40
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
end % function
function val = gvCurrentPackage(this, val)
    % 45 48
    % 46 48
    % 47 48
    if isempty(val)
        cls = this.CurrentClass;
        if not(isempty(cls))
            val = cls.Package;
        end % if
    end % if
end % function
function val = gvCurrentClass(this, val)
    % 56 58
    % 57 58
    if isempty(val)
        currObj = this.CurrentObject;
        if not(isempty(currObj))
            val = classhandle(currObj);
        end % if
    end % if
end % function
function val = gvClassInheritanceTable(this, val)
    % 66 68
    % 67 68
    if isempty(val)
        pkg = this.CurrentPackage;
        if isempty(pkg)
            val = {[],{}};
        else
            val = buildClassInheritance(this, pkg);
            this.ClassInheritanceTable = val;
        end % if
    end % if
end % function
