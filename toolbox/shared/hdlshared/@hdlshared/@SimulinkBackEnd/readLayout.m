function readLayout(this, plainFileName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    initNetworkLayoutInfo(this);
    % 8 10
    pFile = fopen(plainFileName, 'r');
    % 10 12
    if eq(pFile, -1.0)
        error(hdlcodererrormsgid('nodotgenfile'), 'Internal Error: Unable to read layout info');
        % 13 15
    end % if
    % 15 17
    line = fgetl(pFile);
    % 17 19
    [graphScaleFactor, graphWidth, graphHeight] = strread(line, 'graph %n %n %n', 'delimiter', ' ');
    % 19 23
    % 20 23
    % 21 23
    ldBeginPos = 1.0;
    % 23 26
    % 24 26
    while not(feof(pFile))
        % 26 28
        line = readLine(pFile);
        % 28 30
        entryType = strread(line, '%4c', 1.0, 'delimiter', ' ');
        % 30 32
        switch entryType
        case 'grap'
            % 34 37
            % 35 37
        case 'node'
            % 36 38
            [nodeId, xlocation, ylocation, xsize, ysize] = strread(line, 'node %s %n %n %n %n', 1.0);
            % 38 42
            % 39 42
            % 40 42
            storeLayoutInfo(this, nodeId, xlocation, ylocation, xsize, ysize);
        case 'edge'
            % 44 49
            % 45 49
            % 46 49
            % 47 49
        case 'stop'
            % 48 54
            % 49 54
            % 50 54
            % 51 54
            % 52 54
            ldEndPos = getLastPos(this);
            computeBlkPositions(this, ldBeginPos, ldEndPos);
            ldBeginPos = plus(ldEndPos, 1.0);
        otherwise
            % 57 60
            % 58 60
            warning('unknown node type %s', entryType);
            % 60 62
        end % switch
        % 62 64
    end % while
    % 64 66
    fclose(pFile);
    % 66 68
function line = readLine(pFile)
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    line = fgetl(pFile);
    while eq(line(end), '\')
        line(end) = ' ';
        line = horzcat(line, fgetl(pFile));
    end % while
    % 79 81
function pos = getLastPos(this)
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    pos = length(this.pirLayoutInfo.nodeId);
    % 87 89
function initNetworkLayoutInfo(this)
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    this.pirLayoutInfo.nodeId = [];
    % 96 98
    this.pirLayoutInfo.xLoc = [];
    this.pirLayoutInfo.yLoc = [];
    this.pirLayoutInfo.xSize = [];
    this.pirLayoutInfo.ySize = [];
    % 101 104
    % 102 104
    this.pirLayoutInfo.left = [];
    this.pirLayoutInfo.top = [];
    this.pirLayoutInfo.right = [];
    this.pirLayoutInfo.bottom = [];
    % 107 109
function storeLayoutInfo(this, id, xLoc, yLoc, xSize, ySize)
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    if isempty(this.pirLayoutInfo.nodeId)
        this.pirLayoutInfo.nodeId{1.0} = char(id);
        this.pirLayoutInfo.xLoc(1.0) = xLoc;
        this.pirLayoutInfo.yLoc(1.0) = yLoc;
        this.pirLayoutInfo.xSize(1.0) = xSize;
        this.pirLayoutInfo.ySize(1.0) = ySize;
    else
        loc = strcmpi(id, this.pirLayoutInfo.nodeId);
        if any(loc)
            error(hdlerrormsgid('simulinkbackend'), 'duplicate component exists in the list!', nname)
        else
            this.pirLayoutInfo.nodeId{plus(end, 1.0)} = char(id);
            this.pirLayoutInfo.xLoc = horzcat(this.pirLayoutInfo.xLoc, xLoc);
            this.pirLayoutInfo.yLoc = horzcat(this.pirLayoutInfo.yLoc, yLoc);
            this.pirLayoutInfo.xSize = horzcat(this.pirLayoutInfo.xSize, xSize);
            this.pirLayoutInfo.ySize = horzcat(this.pirLayoutInfo.ySize, ySize);
        end % if
    end % if
    % 133 135
function computeBlkPositions(this, dStart, dEnd)
    % 135 168
    % 136 168
    % 137 168
    % 138 168
    % 139 168
    % 140 168
    % 141 168
    % 142 168
    % 143 168
    % 144 168
    % 145 168
    % 146 168
    % 147 168
    % 148 168
    % 149 168
    % 150 168
    % 151 168
    % 152 168
    % 153 168
    % 154 168
    % 155 168
    % 156 168
    % 157 168
    % 158 168
    % 159 168
    % 160 168
    % 161 168
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    this.pirLayoutInfo.xSize(dStart:dEnd) = mrdivide(this.pirLayoutInfo.xSize(dStart:dEnd), this.BlockSizeScale);
    % 168 170
    this.pirLayoutInfo.ySize(dStart:dEnd) = mrdivide(this.pirLayoutInfo.ySize(dStart:dEnd), this.BlockSizeScale);
    % 170 173
    % 171 173
    maxXLoc = max(this.pirLayoutInfo.xLoc(dStart:dEnd));
    maxYLoc = max(this.pirLayoutInfo.yLoc(dStart:dEnd));
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    this.pirLayoutInfo.yLoc(dStart:dEnd) = minus(maxYLoc, this.pirLayoutInfo.yLoc(dStart:dEnd));
    % 179 183
    % 180 183
    % 181 183
    minXLoc = min(this.pirLayoutInfo.xLoc(dStart:dEnd));
    this.pirLayoutInfo.xLoc(dStart:dEnd) = minus(this.pirLayoutInfo.xLoc(dStart:dEnd), minXLoc);
    % 184 188
    % 185 188
    % 186 188
    aspectRatio = this.H2VAspectRatio;
    % 188 190
    if gt(maxXLoc, maxYLoc)
        xScale = 1.0;
        yScale = 1.0;
    else
        xScale = 1.0;
        yScale = 1.0;
    end % if
    % 196 199
    % 197 199
    xScale = mtimes(xScale, this.B2BHScale);
    yScale = mtimes(yScale, this.B2BVScale);
    % 200 203
    % 201 203
    this.pirLayoutInfo.xLoc(dStart:dEnd) = mtimes(this.pirLayoutInfo.xLoc(dStart:dEnd), xScale);
    % 203 205
    this.pirLayoutInfo.yLoc(dStart:dEnd) = mtimes(this.pirLayoutInfo.yLoc(dStart:dEnd), yScale);
    % 205 209
    % 206 209
    % 207 209
    XMargin = this.HMargin;
    YMargin = this.VMargin;
    % 210 213
    % 211 213
    this.pirLayoutInfo.xLoc(dStart:dEnd) = plus(this.pirLayoutInfo.xLoc(dStart:dEnd), XMargin);
    % 213 215
    this.pirLayoutInfo.yLoc(dStart:dEnd) = plus(this.pirLayoutInfo.yLoc(dStart:dEnd), YMargin);
    % 215 219
    % 216 219
    % 217 219
    this.pirLayoutInfo.left(dStart:dEnd) = minus(this.pirLayoutInfo.xLoc(dStart:dEnd), mrdivide(this.pirLayoutInfo.xSize(dStart:dEnd), 2.0));
    % 219 222
    % 220 222
    this.pirLayoutInfo.top(dStart:dEnd) = minus(this.pirLayoutInfo.yLoc(dStart:dEnd), mrdivide(this.pirLayoutInfo.ySize(dStart:dEnd), 2.0));
    % 222 225
    % 223 225
    this.pirLayoutInfo.right(dStart:dEnd) = plus(this.pirLayoutInfo.xLoc(dStart:dEnd), mrdivide(this.pirLayoutInfo.xSize(dStart:dEnd), 2.0));
    % 225 228
    % 226 228
    this.pirLayoutInfo.bottom(dStart:dEnd) = plus(this.pirLayoutInfo.yLoc(dStart:dEnd), mrdivide(this.pirLayoutInfo.ySize(dStart:dEnd), 2.0));
    % 228 233
    % 229 233
    % 230 233
    % 231 233
    this.pirLayoutInfo.left(dStart:dEnd) = round(this.pirLayoutInfo.left(dStart:dEnd));
    % 233 235
    this.pirLayoutInfo.top(dStart:dEnd) = round(this.pirLayoutInfo.top(dStart:dEnd));
    % 235 237
    this.pirLayoutInfo.right(dStart:dEnd) = round(this.pirLayoutInfo.right(dStart:dEnd));
    % 237 239
    this.pirLayoutInfo.bottom(dStart:dEnd) = round(this.pirLayoutInfo.bottom(dStart:dEnd));
    % 239 242
    % 240 242
