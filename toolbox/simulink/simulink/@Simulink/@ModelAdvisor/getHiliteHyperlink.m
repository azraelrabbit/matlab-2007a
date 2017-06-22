function hyperlink = getHiliteHyperlink(this, index, check_index)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    model = getfullname(this.System);
    encodedModelName = modeladvisorprivate('HTMLjsencode', model, 'encode');
    % 9 10
    FOUND_OBJECTS = this.CheckCellArray{check_index}.FoundObjects;
    ShowFullName = this.AtticData.ShowFullName;
    if ShowFullName
        objName = encodeStrtoHTMLsymbol(FOUND_OBJECTS(index).fullname);
    else
        objName = encodeStrtoHTMLsymbol(FOUND_OBJECTS(index).name);
    end % if
    if not(isempty(objName))
        hyperlink = horzcat('<a href="matlab: modeladvisorprivate hiliteSystem ', encodedModelName, ' ', horzcat(num2str(check_index), '_', num2str(index)), '">', objName{:}, '</a>');
    else
        parentName = get_param(FOUND_OBJECTS(index).handle, 'Parent');
        if not(isempty(parentName))
            hyperlink = horzcat('<a href="matlab: modeladvisorprivate hiliteSystem ', encodedModelName, ' ', horzcat(num2str(check_index), '_', num2str(index)), '">', parentName, '/??? </a>');
        else
            hyperlink = horzcat('<a href="matlab: modeladvisorprivate hiliteSystem ', encodedModelName, ' ', horzcat(num2str(check_index), '_', num2str(index)), '">', 'Name is empty', '</a>');
        end % if
    end % if
    return;
end % function
function dstString = encodeStrtoHTMLsymbol(srcString)
    % 30 32
    % 31 32
    EncodeTable = {'<','&#60;';'>','&#62;';'&','&#38;';'#','&#35;'};
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    dstString = '';
    for i=1.0:length(srcString)
        for j=1.0:length(EncodeTable)
            dstSubString = strrep(srcString(i), EncodeTable(j, 1.0), EncodeTable(j, 2.0));
            if not(strcmp(dstSubString, srcString(i)))
                break
            end % if
        end % for
        dstString = horzcat(dstString, dstSubString);
    end % for
end % function
