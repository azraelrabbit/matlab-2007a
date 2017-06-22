function dlgStruct = getDialogSchema(this, dummy_arg)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    padSigAt = dspGetLeafWidgetBase('combobox', 'Pad signal at:', 'padSigAt', this, 'padSigAt');
    % 15 17
    padSigAt.Entries = ctranspose(set(this, 'padSigAt'));
    padSigAt.Tunable = 0.0;
    padSigAt.Visible = 1.0;
    padSigAt.DialogRefresh = 1.0;
    % 20 23
    % 21 23
    zpadAlong = dspGetLeafWidgetBase('combobox', 'Pad along:', 'zpadAlong', this, 'zpadAlong');
    % 23 25
    zpadAlong.Entries = ctranspose(set(this, 'zpadAlong'));
    zpadAlong.Tunable = 0.0;
    zpadAlong.Visible = 1.0;
    zpadAlong.DialogRefresh = 1.0;
    % 28 31
    % 29 31
    padNumOutRowsSpecMethod = dspGetLeafWidgetBase('combobox', 'Number of output rows:', 'padNumOutRowsSpecMethod', this, 'padNumOutRowsSpecMethod');
    % 31 33
    padNumOutRowsSpecMethod.Entries = ctranspose(set(this, 'padNumOutRowsSpecMethod'));
    padNumOutRowsSpecMethod.Tunable = 0.0;
    padNumOutRowsSpecMethod.DialogRefresh = 1.0;
    % 35 38
    % 36 38
    numOutRows = dspGetLeafWidgetBase('edit', 'Specified number of output rows:', 'numOutRows', this, 'numOutRows');
    % 38 40
    numOutRows.Tunable = 0.0;
    % 40 43
    % 41 43
    padNumOutColsSpecMethod = dspGetLeafWidgetBase('combobox', 'Number of output columns:', 'padNumOutColsSpecMethod', this, 'padNumOutColsSpecMethod');
    % 43 45
    padNumOutColsSpecMethod.Entries = ctranspose(set(this, 'padNumOutColsSpecMethod'));
    padNumOutColsSpecMethod.Tunable = 0.0;
    padNumOutColsSpecMethod.DialogRefresh = 1.0;
    % 47 50
    % 48 50
    numOutCols = dspGetLeafWidgetBase('edit', 'Specified number of output columns:', 'numOutCols', this, 'numOutCols');
    % 50 52
    numOutCols.Tunable = 0.0;
    % 52 56
    % 53 56
    % 54 56
    truncOrWrapMode = dspGetLeafWidgetBase('combobox', 'Action when output size is smaller than input size:', 'truncOrWrapMode', this, 'truncOrWrapMode');
    % 56 59
    % 57 59
    truncOrWrapMode.Entries = ctranspose(set(this, 'truncOrWrapMode'));
    truncOrWrapMode.Tunable = 0.0;
    truncOrWrapMode.DialogRefresh = 1.0;
    % 61 65
    % 62 65
    % 63 65
    trunc_flag = dspGetLeafWidgetBase('combobox', 'Action when truncation occurs:', 'trunc_flag', this, 'trunc_flag');
    % 65 68
    % 66 68
    trunc_flag.Entries = ctranspose(set(this, 'trunc_flag'));
    trunc_flag.Tunable = 0.0;
    % 69 73
    % 70 73
    % 71 73
    wrap_flag = dspGetLeafWidgetBase('combobox', 'Action when wrap occurs:', 'wrap_flag', this, 'wrap_flag');
    % 73 76
    % 74 76
    wrap_flag.Entries = ctranspose(set(this, 'wrap_flag'));
    wrap_flag.Tunable = 0.0;
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    if strcmp(this.zpadAlong, 'None')
        padNumOutRowsSpecMethod.Visible = 0.0;
        numOutRows.Visible = 0.0;
        padNumOutColsSpecMethod.Visible = 0.0;
        numOutCols.Visible = 0.0;
        truncOrWrapMode.Visible = 0.0;
        trunc_flag.Visible = 0.0;
        wrap_flag.Visible = 0.0;
    else
        if strcmp(this.zpadAlong, 'Columns')
            % 92 94
            padNumOutColsSpecMethod.Visible = 0.0;
            numOutCols.Visible = 0.0;
            padNumOutRowsSpecMethod.Visible = 1.0;
            if strcmp(this.padNumOutRowsSpecMethod, 'User-specified')
                numOutRows.Visible = 1.0;
                if strcmp(this.padSigAt, 'End')
                    truncOrWrapMode.Visible = 1.0;
                    if strcmp(this.truncOrWrapMode, 'Truncate')
                        trunc_flag.Visible = 1.0;
                        wrap_flag.Visible = 0.0;
                    else
                        trunc_flag.Visible = 0.0;
                        wrap_flag.Visible = 1.0;
                    end
                else
                    % 108 110
                    truncOrWrapMode.Visible = 0.0;
                    trunc_flag.Visible = 1.0;
                    wrap_flag.Visible = 0.0;
                end
            else
                if strcmp(this.padNumOutRowsSpecMethod, 'Next power of two')
                    numOutRows.Visible = 0.0;
                    truncOrWrapMode.Visible = 0.0;
                    trunc_flag.Visible = 0.0;
                    wrap_flag.Visible = 0.0;
                end
            end
        else
            if strcmp(this.zpadAlong, 'Rows')
                padNumOutRowsSpecMethod.Visible = 0.0;
                numOutRows.Visible = 0.0;
                padNumOutColsSpecMethod.Visible = 1.0;
                if strcmp(this.padNumOutColsSpecMethod, 'User-specified')
                    numOutCols.Visible = 1.0;
                    if strcmp(this.padSigAt, 'End')
                        truncOrWrapMode.Visible = 1.0;
                        if strcmp(this.truncOrWrapMode, 'Truncate')
                            trunc_flag.Visible = 1.0;
                            wrap_flag.Visible = 0.0;
                        else
                            trunc_flag.Visible = 0.0;
                            wrap_flag.Visible = 1.0;
                        end
                    else
                        % 138 140
                        truncOrWrapMode.Visible = 0.0;
                        trunc_flag.Visible = 1.0;
                        wrap_flag.Visible = 0.0;
                    end
                else
                    if strcmp(this.padNumOutColsSpecMethod, 'Next power of two')
                        numOutCols.Visible = 0.0;
                        truncOrWrapMode.Visible = 0.0;
                        trunc_flag.Visible = 0.0;
                        wrap_flag.Visible = 0.0;
                    end
                end
            else
                if strcmp(this.zpadAlong, 'Columns and rows')
                    padNumOutRowsSpecMethod.Visible = 1.0;
                    padNumOutColsSpecMethod.Visible = 1.0;
                    truncOrWrapMode.Visible = 0.0;
                    wrap_flag.Visible = 0.0;
                    trunc_flag.Visible = 0.0;
                    if strcmp(this.padNumOutColsSpecMethod, 'User-specified')
                        numOutCols.Visible = 1.0;
                        trunc_flag.Visible = 1.0;
                    else
                        numOutCols.Visible = 0.0;
                    end
                    if strcmp(this.padNumOutRowsSpecMethod, 'User-specified')
                        numOutRows.Visible = 1.0;
                        trunc_flag.Visible = 1.0;
                    else
                        numOutRows.Visible = 0.0;
                    end
                    % 170 172
                end
            end
        end
    end
    items = cellhorzcat(padSigAt, zpadAlong, padNumOutRowsSpecMethod, numOutRows, padNumOutColsSpecMethod, numOutCols, truncOrWrapMode, trunc_flag, wrap_flag);
    % 176 179
    % 177 179
    dlgStruct = this.getRootSchemaStruct(items, 5.0);
    % 179 189
    % 180 189
    % 181 189
    % 182 189
    % 183 189
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    discStr = sprintf('\n  Fixed-point pane only applies when block inputs are fixed-point signals and wrapping occurs because the output size is smaller than the input size.');
    emptyFixpt = dspGetLeafWidgetBase('text', discStr, 'emptyFixpt', 0.0);
    emptyFixpt.WordWrap = 1.0;
    % 191 193
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items = cellhorzcat(emptyFixpt, dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0});
    % 193 196
    % 194 196
    if wrap_flag.Visible
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 1.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Visible = 1.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{2.0}.Visible = 0.0;
    end
end
