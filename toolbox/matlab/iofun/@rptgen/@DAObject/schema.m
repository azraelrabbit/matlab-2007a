





function schema
    superclassObject = {};
    try



        hackObject = DAStudio.Object;,         clear hackObject;


        pkgDAS = findpackage('DAStudio');
        if not(isempty(pkgDAS))
            superclassObject = cellhorzcat(pkgDAS.findclass('Object'));
        end
    end % try

    pkg = findpackage('rptgen');
    clsH = schema.class(pkg, 'DAObject', superclassObject{:});



    p = rptgen.prop(clsH, 'ErrorMessage', 'String', '');
    p.AccessFlags.Serialize = 'off';

    p.Visible = 'off';

    p = rptgen.prop(clsH, 'Dirty', 'bool', false);
    p.AccessFlags.Serialize = 'off';

    p.Visible = 'off';

    p = rptgen.prop(clsH, 'DirtyListeners', 'handle vector');
    p.AccessFlags.Serialize = 'off';


    p.Visible = 'off';












































    m = find(clsH.Method, 'Name', 'buildErrorMessage');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string','bool'};
        s.OutputTypes = {'mxArray'};
    end


    m = find(clsH.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end

    m = find(clsH.Method, 'Name', 'view');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {};
    end

    m = find(clsH.Method, 'Name', 'updateErrorState');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {};
    end

    m = schema.method(clsH, 'dlgDatatypeRealPoint');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgDatatypeDoubleVector');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgDatatypeHandle');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgDatatypeStringVector');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgDatatypeString');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgDatatypeEnum');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {};

    m = schema.method(clsH, 'dlgFileBrowse');
    s = m.Signature;
    s.varargin = 'on';
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {};










    mNames = get(clsH.Methods, 'Name');
    [mBad, badIdx] = setdiff(mNames, {'schema';'DAObject';'disp';'dlgMain';'dlgWidget';'dlgContainer';'dlgEnable';'dlgSet';'dlgText';'dlgFileBrowse';'getDialogSchema';'dlgDatatypeEnum';'dlgDatatypeHandle';'dlgDatatypeRealPoint';'dlgDatatypeDoubleVector';'dlgDatatypeString';'dlgDatatypeStringVector';'buildErrorMessage';'moveUp';'moveDown';'moveLeft';'moveRight';'updateErrorState';'setDirty';'getDirty';'view';'viewHelp';'isCopyable';'isDeletable';'doCopy';'doDelete';'doClose';'mcodeConstructor';'setParent';'ja';'CVS'});






































    if not(isempty(badIdx))

        delete(clsH.Methods);
        error('rptgen:UnregisteredMethod', 'Unregistered component method - could not instantiate class %s', clsH.Name);

    end
end