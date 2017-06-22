function frameObj = framerect(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch nargin
    case 0.0
        frameObj.Class = 'framerect';
        frameObj.ContentType = [];
        frameObj.fResizable = [];
        frameObj.MinWidth = [];
        frameObj.MaxLine = [];
        frameObj.MinLine = [];
        frameObj = class(frameObj, 'framerect', hgbin);
        return;
    case 1.0
        HGpatch = varargin{1.0};
    otherwise
        HGpatch = patch(varargin{:}, 'w');
    end % switch
    % 22 23
    set(HGpatch, 'FaceColor', 'none');
    set(HGpatch, 'EdgeColor', 'none');
    set(HGpatch, 'ButtonDownFcn', 'doclick(gcbo)', 'EraseMode', 'xor');
    % 26 28
    % 27 28
    frameObj.Class = 'framerect';
    frameObj.ContentType = '';
    frameObj.fResizable = [0.0 0.0 0.0 0.0];
    frameObj.MinWidth = .01;
    % 32 33
    frameObj.MaxLine = [];
    frameObj.MinLine = [];
    % 35 36
    binObj = hgbin(HGpatch);
    % 37 38
    frameObj = class(frameObj, 'framerect', binObj);
end % function
