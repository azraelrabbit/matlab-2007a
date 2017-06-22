function errMsg = cacheVideoSignalData(this)
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
    errMsg = '';
    slSD = this.hSLConnectMgr.getSignalData;
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if le(slSD.period, 0.0)
        this.frameRate = 1.0;
    else
        this.frameRate = rdivide(1.0, slSD.period);
    end % if
    % 29 32
    % 30 32
    this.frameRows = slSD.dims(1.0);
    if gt(numel(slSD.dims), 1.0)
        this.frameCols = slSD.dims(2.0);
    else
        this.frameCols = 1.0;
    end % if
    this.numFrames = 1.0;
    this.dataType = slSD.dtype;
    % 39 41
    switch slSD.numComponents
    case 3.0
        % 42 44
        this.colorspace = 'rgb';
        this.colorMap = [];
    case 1.0
        % 46 49
        % 47 49
        rgb = false;
        if gt(numel(slSD.dims), 2.0)
            if eq(slSD.dims(1.0, 3.0), 3.0)
                this.colorspace = 'rgb';
                rgb = true;
            end % if
        end % if
        % 55 57
        if not(rgb)
            % 57 59
            this.colorspace = 'intensity';
            if strcmpi(slSD.dtype, 'boolean')
                this.colormap = [0.0 0.0 0.0 ;  1.0 1.0 1.0];
            else
                this.colorMap = gray(256.0);
            end % if
        end % if
    otherwise
        % 66 68
        errMsg = 'There must be exactly 1 or 3 components selected for video signals';
        return;
    end % switch
