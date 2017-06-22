function fName = gr_getFileName(this, id, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    imStruct = rptgen.getImgFormat(this.ImageFormat);
    if isa(id, 'Stateflow.Junction') || isa(id, 'Stateflow.Transition')
        uniqueName = '';
    else
        uniqueName = sf('FullNameOf', get(id, 'ID'));
    end % if
    % 17 18
    imFile = getImgName(rptgen.appdata_rg, char(imStruct.getExtension), 'sf', uniqueName);
    % 19 21
    % 20 21
    if imFile.isnew
        this.takeSnapshot(id, imStruct, imFile);
    end % if
    % 24 25
    fName = imFile.relname;
end % function
