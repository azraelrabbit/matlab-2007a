function [shortDesc, longDesc, dataType] = getRefentryInfo(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    shortDesc = this.DescriptionShort;
    longDesc = this.DescriptionLong;
    dataType = this.DataType;
    % 9 11
    if isempty(shortDesc)
        tType = getTransformType(this);
        if ~(isempty(tType))
            sr = RptgenML.StylesheetRoot;
            if isempty(sr.(horzcat('Params', tType)))
            else
                % 16 18
                % 17 19
                paramLib = sr.getParamsLibrary(tType);
                libElement = find(paramLib, 'ID', this.ID);
                if ~(isempty(libElement))
                    libElement = libElement(1.0);
                    shortDesc = libElement.DescriptionShort;
                    longDesc = libElement.DescriptionLong;
                    dataType = libElement.DataType;
                    % 25 27
                    this.DescriptionShort = shortDesc;
                    this.DescriptionLong = longDesc;
                    this.DataType = dataType;
                else
                    % 30 33
                    % 31 33
                end
            end
        end
    end
end
function tType = getTransformType(this)
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    tType = '';
    % 44 46
    this = this.up;
    while ~(isempty(this))
        if isa(this, 'RptgenML.StylesheetEditor')
            tType = this.TransformType;
        else
            if isa(this, 'RptgenML.LibraryCategory')
                return
            end
        end
        this = this.up;
    end % while
end
