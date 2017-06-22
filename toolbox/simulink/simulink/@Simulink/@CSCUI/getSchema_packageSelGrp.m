function packageSelGrp = getSchema_packageSelGrp(hUI)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkgSelBox.Name = 'Select package:';
    pkgSelBox.Type = 'combobox';
    pkgSelBox.Tag = 'tPackageSelectCombo';
    pkgSelBox.ObjectMethod = 'selectPackage';
    pkgSelBox.MethodArgs = {'%value'};
    pkgSelBox.ArgDataTypes = {'mxArray'};
    pkgSelBox.Entries = ctranspose(hUI.PackageNames);
    pkgSelBox.Value = hUI.CurrPackage;
    pkgSelBox.Mode = 1.0;
    pkgSelBox.DialogRefresh = 1.0;
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    packageSelGrp.Type = 'group';
    packageSelGrp.Tag = 'tPackageSelectGroup';
    packageSelGrp.LayoutGrid = [1.0 2.0];
    packageSelGrp.ColStretch = [0.0 1.0];
    % 29 30
    pkgSelBox.RowSpan = [1.0 1.0];
    pkgSelBox.ColSpan = [1.0 1.0];
    % 32 33
    packageSelGrp.Items = cellhorzcat(pkgSelBox);
end % function
