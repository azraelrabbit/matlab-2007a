function dlgStruct = getDialogSchema(this, dummy)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    blkh = this.Block.Handle;
    mask_enables = get_param(blkh, 'MaskEnables');
    old_mask_enables = mask_enables;
    [iShape, iFill, iDisplay, iIntensity, iColor, iOpacity, iViewport, iAntialiasing, iInType, iImagePorts] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    inType = dspGetLeafWidgetBase('combobox', 'Input image type:', 'inType', this, 'inType');
    inType.Entries = ctranspose(set(this, 'inType'));
    inType.DialogRefresh = 0.0;
    inType.Visible = 0.0;
    inType.Enabled = 0.0;
    mask_enables{iInType} = 'off';
    % 23 25
    imagePorts = dspGetLeafWidgetBase('combobox', 'Image signal:', 'imagePorts', this, 'imagePorts');
    imagePorts.Entries = ctranspose(set(this, 'imagePorts'));
    imagePorts.Visible = 1.0;
    imagePorts.DialogRefresh = 1.0;
    % 28 30
    if not(strcmp(this.inType, 'Obsolete'))
        if strcmp(this.inType, 'Intensity')
            this.imagePorts = 'One multidimensional signal';
            % 32 34
            this.color = this.intensity;
        else
            if strcmp(this.inType, 'RGB')
                this.imagePorts = 'Separate color signals';
            end
        end
        this.inType = 'Obsolete';
    end
    shape = dspGetLeafWidgetBase('combobox', 'Shape:', 'shape', this, 'shape');
    shape.Entries = ctranspose(set(this, 'shape'));
    shape.DialogRefresh = 1.0;
    % 44 47
    % 45 47
    fill = dspGetLeafWidgetBase('checkbox', 'Fill shapes', 'fill', this, 'fill');
    % 47 49
    fill.DialogRefresh = 1.0;
    dontNeedFillOption = strcmp(this.shape, 'Lines');
    if dontNeedFillOption
        fill.Visible = 0.0;
        fill.Enabled = 0.0;
        mask_enables{iFill} = 'off';
    else
        fill.Visible = 1.0;
        fill.Enabled = 1.0;
        mask_enables{iFill} = 'on';
    end
    if this.fill && not(dontNeedFillOption)
        display = dspGetLeafWidgetBase('combobox', 'Fill value:', 'display', this, 'display');
    else
        display = dspGetLeafWidgetBase('combobox', 'Border value:', 'display', this, 'display');
    end
    display.Entries = ctranspose(set(this, 'display'));
    display.DialogRefresh = 1.0;
    % 66 68
    intensity = dspGetLeafWidgetBase('edit', 'Value:', 'intensity', this, 'intensity');
    % 68 72
    % 69 72
    % 70 72
    color = dspGetLeafWidgetBase('edit', 'Value(s):', 'color', this, 'color');
    % 72 75
    % 73 75
    opacity = dspGetLeafWidgetBase('edit', 'Opacity factor (between 0 and 1):', 'opacity', this, 'opacity');
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    intensity.Visible = 0.0;
    intensity.Enabled = 0.0;
    mask_enables{iIntensity} = 'off';
    intensity.Tunable = 0.0;
    if strcmp(this.display, 'User-specified value')
        color.Visible = 1.0;
        color.Enabled = 1.0;
        mask_enables{iColor} = 'on';
        color.Tunable = 1.0;
    else
        color.Visible = 0.0;
        color.Enabled = 0.0;
        mask_enables{iColor} = 'off';
        color.Tunable = 0.0;
    end
    if not(dontNeedFillOption) && this.fill
        opacity.Visible = 1.0;
        opacity.Enabled = 1.0;
        mask_enables{iOpacity} = 'on';
        opacity.Tunable = 1.0;
    else
        opacity.Visible = 0.0;
        opacity.Enabled = 0.0;
        mask_enables{iOpacity} = 'off';
        opacity.Tunable = 0.0;
    end
    viewport = dspGetLeafWidgetBase('combobox', 'Draw shapes in:', 'viewport', this, 'viewport');
    viewport.Entries = ctranspose(set(this, 'viewport'));
    antialiasing = dspGetLeafWidgetBase('checkbox', 'Use antialiasing', 'antialiasing', this, 'antialiasing');
    if not(strcmp(this.shape, 'Rectangles'))
        antialiasing.Visible = 1.0;
    else
        antialiasing.Visible = 0.0;
    end
    % 113 115
    helptext.Type = 'text';
    if strcmp(this.shape, 'Rectangles')
        helptext.Name = 'The input to the Pts port must be a four-by-N matrix where each column is of the form [r c height width] and specifies a different rectangle.';
    else
        if strcmp(this.shape, 'Lines')
            helptext.Name = 'The input to the Pts port must be a 2L-by-N matrix where each column specifies a different polyline. Each column must be of the form [r1,c1,r2,c2...rL,cL], which specifies the points to be connected in consecutive order.';
        else
            if strcmp(this.shape, 'Polygons')
                helptext.Name = 'The input to the Pts port must be a 2L-by-N matrix where each column specifies a different polygon. Each column must be of the form [r1,c1,r2,c2...rL,cL], which specifies the points to be connected in consecutive order. In this case [r1,c1] is also connected to [rL,cL].';
            else
                helptext.Name = 'The input to the Pts port must be a three-by-N matrix where each column is of the form [r c radius] and specifies a different circle.';
            end
        end
    end
    helptext.Tag = 'parameterPane';
    helptext.WordWrap = 1.0;
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = cellhorzcat(shape, helptext, fill, display, intensity, color, opacity, viewport, antialiasing, inType, imagePorts);
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
    % 139 141
    if not(isequal(mask_enables, old_mask_enables))
        set_param(blkh, 'MaskEnables', mask_enables);
    end
end
