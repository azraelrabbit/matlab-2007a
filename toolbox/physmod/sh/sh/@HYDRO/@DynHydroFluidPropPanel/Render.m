function [retVal, schema] = Render(hThis, schema)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    retVal = true;
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    listener = @(source,dialog,value,tag)hThis.OnFluidPropertyChange(dialog);
    % 18 20
    fluidH = pmsl_getobjecthandle(hThis, 'class', 'PMDialogs.DynDropDown', 'Label', 'Hydraulic fluid:');
    % 20 23
    % 21 23
    fluidH.addListener(listener);
    hThis.ChildHandles.hFluid = fluidH;
    % 24 26
    tempH = pmsl_getobjecthandle(hThis, 'class', 'PMDialogs.DynEditBox', 'Label', 'System temperature (C):');
    % 26 29
    % 27 29
    tempH.addListener(listener);
    hThis.ChildHandles.hTemp = tempH;
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    hThis.FluidDb = struct2cell(sh_stockfluidproperties);
    [viscValStr, densValStr, bulkValStr, errStr, panelVis] = ComputePropsAsStrings(hThis);
    % 36 51
    % 37 51
    % 38 51
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    [retval, schema] = hThis.renderChildren();
    schema = schema{1.0};
    % 52 55
    % 53 55
    [displaySchema, displayPath] = pmsl_extractdialogschema(schema, 'Type', 'panel', 'Name', 'dummy');
    % 55 58
    % 56 58
    displaySchema.Visible = panelVis(1.0);
    hThis.ChildTags.props = displaySchema.Tag;
    schema = pmsl_updatedialogschema(schema, displaySchema, displayPath);
    % 60 63
    % 61 63
    [densitySchema, densityPath] = pmsl_extractdialogschema(schema, 'Type', 'edit', 'Name', 'Density (kg/m^3):');
    % 63 66
    % 64 66
    densitySchema.Value = densValStr;
    hThis.ChildTags.density = densitySchema.Tag;
    schema = pmsl_updatedialogschema(schema, densitySchema, densityPath);
    % 68 71
    % 69 71
    [viscositySchema, viscosityPath] = pmsl_extractdialogschema(schema, 'Type', 'edit', 'Name', 'Viscosity (cSt):');
    % 71 74
    % 72 74
    viscositySchema.Value = viscValStr;
    hThis.ChildTags.viscosity = viscositySchema.Tag;
    schema = pmsl_updatedialogschema(schema, viscositySchema, viscosityPath);
    % 76 79
    % 77 79
    [modulusSchema, modulusPath] = pmsl_extractdialogschema(schema, 'Type', 'edit', 'Name', 'Bulk Modulus (Pa):');
    % 79 82
    % 80 82
    modulusSchema.Value = bulkValStr;
    hThis.ChildTags.modulus = modulusSchema.Tag;
    schema = pmsl_updatedialogschema(schema, modulusSchema, modulusPath);
    % 84 87
    % 85 87
    [errorSchema, errorPath] = pmsl_extractdialogschema(schema, 'Type', 'text', 'Name', 'Error:');
    % 87 90
    % 88 90
    errorSchema.Visible = panelVis(2.0);
    hThis.ChildTags.error = errorSchema.Tag;
    errorSchema.Name = errStr;
    schema = pmsl_updatedialogschema(schema, errorSchema, errorPath);
    % 93 95
end
