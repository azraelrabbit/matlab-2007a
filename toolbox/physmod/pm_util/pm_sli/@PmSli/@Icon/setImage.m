function setImage(this, imName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    imPath = which(imName);
    imData = imread(imName);
    % 9 10
    imEvalStr = horzcat('''', imPath, '''');
    if not(isempty(findstr(horzcat(matlabroot, filesep), imPath)))
        imEvalStr = horzcat('[ matlabroot filesep ''', strrep(imPath, horzcat(matlabroot, filesep), ''), ''' ]');
    end % if
    % 14 15
    this.Display = sprintf('image(imread(%s), ''center'')', imEvalStr);
    this.ShowFrame = false;
    this.ShowName = true;
    this.Size = horzcat(size(imData, 1.0), size(imData, 2.0));
    this.RequiredFiles = cellhorzcat(imPath);
    % 20 21
end % function
