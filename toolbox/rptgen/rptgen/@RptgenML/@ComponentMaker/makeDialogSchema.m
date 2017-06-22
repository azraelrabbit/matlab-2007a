function makeDialogSchema(thisCM, fileName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if gt(nargin, 1.0) && isnumeric(fileName)
        fid = fileName;
    else
        if lt(nargin, 2.0)
            fileName = 'getDialogSchema.m';
        end % if
        fid = thisCM.openFile(fileName);
    end % if
    % 15 16
    fprintf(fid, 'function dlgStruct = getDialogSchema(thisComp, name)\n');
    fprintf(fid, '%%GETDIALOGSCHEMA Create a properties dialog \n');
    fprintf(fid, '%%  DLGSTRUCT = GETDIALOGSCHEMA(THISCOMP,NAME) is called when the\n');
    fprintf(fid, '%%  Report Explorer displays a properties dialog for a component.\n');
    fprintf(fid, '%% \n');
    fprintf(fid, '%%  The output DLGSTRUCT contains all of the information necessary\n');
    fprintf(fid, '%%  to create the dialg.\n');
    fprintf(fid, '%% \n');
    fprintf(fid, '%%  The input THISCOMP is an instance of the component being edited.\n');
    fprintf(fid, '%%  The input NAME is a string sometimes passed to the method in \n');
    fprintf(fid, '%%     order to build a specific type of panel.  NAME is almost \n');
    fprintf(fid, '%%     always empty in the Report Explorer.\n');
    fprintf(fid, '%% \n');
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    thisCM.writeHeader(fid);
    % 34 36
    % 35 36
    fprintf(fid, '%% ************************************************************************ \n');
    fprintf(fid, '%% * This block of code shows how to create a widget for each component   * \n');
    fprintf(fid, '%% * property.  A widget shows current property values and usually        * \n');
    fprintf(fid, '%% * enables the user to change the value. Widgets consist of a "control" * \n');
    fprintf(fid, '%% * such as an edit field or combobox and a "prompt" or text description * \n');
    fprintf(fid, '%% * of the property.  The widget type is automatically chosen based upon * \n');
    fprintf(fid, '%% * the data type of the property.                                       * \n');
    fprintf(fid, '%% *                                                                      * \n');
    fprintf(fid, '%% * Widgets are created with the DLGWIDGET command.  The first argument  * \n');
    fprintf(fid, '%% * is the property which the widget is editing. Additional arguments    * \n');
    fprintf(fid, '%% * are extra fields which control layout and behavior.                  * \n');
    fprintf(fid, '%% *                                                                      * \n');
    fprintf(fid, '%% * Widget positions are layed out on a simple grid defined by the       * \n');
    fprintf(fid, '%% * "RowSpan" and "ColSpan" fields.  These fields define the first and   * \n');
    fprintf(fid, '%% * last row or column in which the widget appears.                      * \n');
    fprintf(fid, '%% ************************************************************************ \n\n');
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    thisProp = thisCM.down;
    rowCount = 0.0;
    rowStretch = '';
        while not(isempty(thisProp))
        rowCount = plus(rowCount, 1.0);
        rowStretch = horzcat(rowStretch, '0 ');
        % 65 68
        % 66 68
        % 67 68
        fprintf(fid, 'w%s = thisComp.dlgWidget(''%s'',...\n        ''RowSpan'',[%i %i],''ColSpan'',[1 2]);\n\n', thisProp.PropertyName, thisProp.PropertyName, rowCount, rowCount);
        % 69 71
        % 70 71
        thisProp = thisProp.right;
    end % while
    % 73 74
    if eq(rowCount, 0.0)
        % 75 76
        fprintf(fid, '%% wPropName = thisComp.dlgWidget(''PropName'',...\n%%        ''RowSpan'',[1 1],''ColSpan'',[1 2]);\n\n');
    end % if
    % 78 79
    fprintf(fid, '%% *************************************************************** \n');
    fprintf(fid, '%% * The (optional) "Enabled" field will make the widget appear  * \n');
    fprintf(fid, '%% * non-editable or grey when false.                            * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * The (optional) "DialogRefresh" field will cause the dialog  * \n');
    fprintf(fid, '%% * to redraw if that property is changed.  This is useful if   * \n');
    fprintf(fid, '%% * the "Enabled" state of one widget depends on the value of   * \n');
    fprintf(fid, '%% * another property.                                           * \n');
    fprintf(fid, '%% *************************************************************** \n\n');
    % 88 89
    fprintf(fid, '%%        ''Enabled'', false,...\n');
    fprintf(fid, '%%        ''DialogRefresh'', true,...\n\n');
    % 91 93
    % 92 93
    fprintf(fid, '%% *************************************************************** \n');
    fprintf(fid, '%% * This block of code shows how to organize widgets into a     * \n');
    fprintf(fid, '%% * labeled panel.  You may use as many panels as you wish in   * \n');
    fprintf(fid, '%% * your dialog.  Panels are created with the DLGCONTAINER      * \n');
    fprintf(fid, '%% * command.  The first argument is a cell array of panels or   * \n');
    fprintf(fid, '%% * widgets inside the container.  The second argument is the   * \n');
    fprintf(fid, '%% * label displayed at the top of the container. Additional     * \n');
    fprintf(fid, '%% * inputs control the layout and behavior of the panel.        * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * Panels have RowSpan and ColSpan fields like widgets.  These * \n');
    fprintf(fid, '%% * control the position of the panel when embedded in another  * \n');
    fprintf(fid, '%% * panel.                                                      * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * The "LayoutGrid" field defines the size of the grid used by * \n');
    fprintf(fid, '%% * the contained widgets.  It is of the form                   * \n');
    fprintf(fid, '%% * [NUMBER_OF_ROWS NUMBER_OF_COLUMNS].                         * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * The (optional) "RowStretch" field will cause each row to    * \n');
    fprintf(fid, '%% * grow to its maximum size if true.  RowStretch must have the * \n');
    fprintf(fid, '%% * same number of elements as NUMBER_OF_ROWS in LayoutGrid.    * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * The (optional) "ColStretch" field acts as RowStretch, but   * \n');
    fprintf(fid, '%% * its size must match NUMBER_OF_COLUMNS.                      * \n');
    fprintf(fid, '%% *************************************************************** \n\n');
    % 117 119
    % 118 119
    fprintf(fid, 'cMain = thisComp.dlgContainer({\n');
    thisProp = thisCM.down;
    if isempty(thisProp)
        fprintf(fid, '     thisComp.dlgText(''%s'',''RowSpan'',[1 1],''ColSpan'',[1 2])\n', xlate('No properties'));
        rowCount = 1.0;
        rowStretch = '0';
    else
            while not(isempty(thisProp))
            fprintf(fid, '     w%s\n', thisProp.PropertyName);
            thisProp = thisProp.right;
        end % while
    end % if
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    fprintf(fid, '    },''Properties'',...  %% <-- Modify the panel label here\n');
    fprintf(fid, '      ''LayoutGrid'',[%i 2],...\n', rowCount);
    fprintf(fid, '      ''ColStretch'',[0 1],...\n');
    fprintf(fid, '      ''RowStretch'',[ %s],...\n', rowStretch);
    fprintf(fid, '      ''ColSpan'',[1 1],...\n');
    fprintf(fid, '      ''RowSpan'',[1 1]);\n\n');
    % 141 142
    fprintf(fid, '%% *************************************************************** \n');
    fprintf(fid, '%% * This block of code shows how to create plain text.  The     * \n');
    fprintf(fid, '%% * DLGTEXT command will create a new text labe.  The first     * \n');
    fprintf(fid, '%% * argument is the string to be displayed.  Additional fields  * \n');
    fprintf(fid, '%% * ColSpan, RowSpan, and Enabled act as in a widget.           * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * The (optional) "WordWrap" field causes the label to use     * \n');
    fprintf(fid, '%% * multiple lines if the text is longer than the panel width.  * \n');
    fprintf(fid, '%% * By default, WordWrap is false.                              * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * In this example the text widget is created directly inside  * \n');
    fprintf(fid, '%% * a container instead of being assigned to a variable.  This  * \n');
    fprintf(fid, '%% * sort of nesting works with panels and widgets as well       * \n');
    fprintf(fid, '%% *************************************************************** \n\n');
    % 156 157
    fprintf(fid, 'cHelp = thisComp.dlgContainer({\n');
    fprintf(fid, '          thisComp.dlgText(getDescription(thisComp),...\n');
    fprintf(fid, '            ''WordWrap'', true,...\n');
    fprintf(fid, '            ''ColSpan'',[1 1],''RowSpan'',[1 1])\n');
    fprintf(fid, '        },''Help'',... \n');
    fprintf(fid, '        ''LayoutGrid'',[2 1],...\n');
    fprintf(fid, '        ''ColStretch'',[1],...\n');
    fprintf(fid, '        ''RowStretch'',[0 1],...\n');
    fprintf(fid, '        ''ColSpan'',[1 1],...\n');
    fprintf(fid, '        ''RowSpan'',[2 2]);\n\n');
    % 167 169
    % 168 169
    fprintf(fid, '%% *************************************************************** \n');
    fprintf(fid, '%% * This block of code shows how to create the top-level        * \n');
    fprintf(fid, '%% * dialog.  The dialog is created with the "dlgMain" command.  * \n');
    fprintf(fid, '%% * The first argument is the NAME variable passed in earlier.  * \n');
    fprintf(fid, '%% * The second is a cell array of panels or widgets (created    * \n');
    fprintf(fid, '%% * earlier).  Additional arguments control the layout and      * \n');
    fprintf(fid, '%% * behavior of the dialog.                                     * \n');
    fprintf(fid, '%% *                                                             * \n');
    fprintf(fid, '%% * Dialogs have LayoutGrid, RowStretch, and ColStretch fields  * \n');
    fprintf(fid, '%% * like panels.  These control the position of the embedded    * \n');
    fprintf(fid, '%% * panels and widgets.                                         * \n');
    fprintf(fid, '%% *************************************************************** \n\n');
    % 181 182
    fprintf(fid, 'dlgStruct = thisComp.dlgMain(name,{\n');
    fprintf(fid, '       cMain\n');
    fprintf(fid, '       cHelp\n');
    fprintf(fid, ' },''LayoutGrid'',[2 1],...\n');
    fprintf(fid, '   ''RowStretch'',[0 1],...\n');
    fprintf(fid, '   ''ColStretch'',[1]);\n\n');
    % 188 189
    fprintf(fid, '%% *************************************************************** \n');
    fprintf(fid, '%% * Structure fields not mentioned in this file are             * \n');
    fprintf(fid, '%% * undocumented and subject to change in future releases.      * \n');
    fprintf(fid, '%% *************************************************************** \n\n');
    % 193 194
    fclose(fid);
    % 195 196
    thisCM.viewFile(fileName, 1.0);
end % function
