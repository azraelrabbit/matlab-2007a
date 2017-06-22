function c = getChildren(dao)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent COMPONENT_MAKER_DATA_LIBRARY;
    % 7 9
    if isempty(COMPONENT_MAKER_DATA_LIBRARY)
        COMPONENT_MAKER_DATA_LIBRARY = RptgenML.Library;
        numCat = RptgenML.LibraryCategory(xlate('Numeric Properties'), 'HelpMapKey', 'obj.RptgenML.ComponentMakerData');
        % 11 13
        connect(numCat, COMPONENT_MAKER_DATA_LIBRARY, 'up');
        % 13 15
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_Double_Property', 'DataTypeString', 'double', 'FactoryValueString', '1.1', 'Description', xlate('New double precision numeric property')), numCat, 'up');
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_Integer_Property', 'DataTypeString', 'int32', 'FactoryValueString', '1', 'Description', xlate('New integer numeric property')), numCat, 'up');
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        strCat = RptgenML.LibraryCategory(xlate('String Properties'), 'HelpMapKey', 'obj.RptgenML.ComponentMakerData');
        % 27 29
        connect(strCat, COMPONENT_MAKER_DATA_LIBRARY, 'up');
        % 29 31
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_String_Property', 'DataTypeString', 'string', 'FactoryValueString', '''Default value''', 'Description', xlate('New string property')), strCat, 'up');
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_ParsedString_Property', 'DataTypeString', rptgen.makeStringType, 'FactoryValueString', '''pi = %<pi>''', 'Description', xlate('New workspace parsed string property')), strCat, 'up');
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_StringVector_Property', 'DataTypeString', 'string vector', 'FactoryValueString', '{''default'',''value''}', 'Description', xlate('New string vector property')), strCat, 'up');
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        enumCat = RptgenML.LibraryCategory(xlate('Enumerated Properties'), 'HelpMapKey', 'obj.RptgenML.ComponentMakerData');
        % 47 49
        connect(enumCat, COMPONENT_MAKER_DATA_LIBRARY, 'up');
        % 49 51
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_Enumerated_Property', 'DataTypeString', '!ENUMERATION', 'FactoryValueString', '''value1''', 'EnumNames', {'Value 1','Value 2'}, 'EnumValues', {'value1','value2'}, 'Description', xlate('New enumerated property')), enumCat, 'up');
        % 51 59
        % 52 59
        % 53 59
        % 54 59
        % 55 59
        % 56 59
        % 57 59
        connect(RptgenML.ComponentMakerData('PropertyName', 'New_TrueFalse_Property', 'DataTypeString', 'bool', 'FactoryValueString', 'true', 'Description', xlate('New true/false property')), enumCat, 'up');
        % 59 64
        % 60 64
        % 61 64
        % 62 64
    end
    % 64 66
    c = COMPONENT_MAKER_DATA_LIBRARY.getChildren;
end
