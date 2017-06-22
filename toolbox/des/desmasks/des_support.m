function des_support(action, block, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    des_support_debug = 0.0;
    des_ignore_port_proc = 0.0;
    % 13 17
    % 14 17
    % 15 17
    if lt(nargin, 2.0)
        block = gcbh;
    end % if
    % 19 23
    % 20 23
    % 21 23
    hBlk = get_param(block, 'Handle');
    tempBlkName = get_param(block, 'name');
    tempBlkName = strrep(tempBlkName, '/', '//');
    blkName = horzcat(get_param(block, 'parent'), '/', tempBlkName);
    blkName = strrep(blkName, char(10.0), ' ');
    blkName = strrep(blkName, char(13.0), ' ');
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    if des_support_debug
        disp(horzcat('starting @@ des_support(', action, ',', num2str(block), '[', blkName, '],', varargin{:}, ')'));
    end % if
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    switch action
    case 'desCloseFcn'
    case 'desCopyFcn'
        % 46 48
        des_get_configset(blkName);
        des_first_use_dlg(get_param(blkName, 'MaskType'));
    case 'desDeleteFcn'
    case 'desDeleteSLPort'
        % 51 53
        if not(des_ignore_port_proc)
            local_port_delete_to_des_fcss(block, varargin{1.0});
        end % if
    case 'desDeleteDefcgInSSFcn'
        % 56 58
        delete_defcg_in_ss(block);
    case 'desLoadFcn'
        % 59 61
        des_get_configset(blkName);
        % 62 64
    case 'desModelCloseFcn'
    case 'desNameChangeFcn'
        % 64 66
        des_get_configset(blkName);
    case 'desOpenFcn'
    case 'desPostSaveFcn'
    case 'desPreSaveFcn'
    case 'desStartFcn'
    case 'desStopFcn'
    case 'desUndoDeleteFcn'
    case 'desGatewayNameChangeFcn'
    case 'desGatewayCopyFcn'
    case 'desSolverSubsystemOpenFcn'
        % 76 78
    case 'desSolverInitFcn'
        % 77 79
        local_delete_solver_ss_children(blkName)
    case 'desInitUDSLPort'
        % 80 82
        if not(des_ignore_port_proc)
            local_init_ud_sl_port(block, varargin{1.0}, varargin{2.0});
        end % if
    case 'desCopySLPort'
        % 85 87
        if not(des_ignore_port_proc)
            local_port_add_to_des_fcss(block, varargin{1.0});
        end % if
    case 'desNameChangeSLPort'
        % 90 92
        if not(des_ignore_port_proc)
            local_port_name_change(block, varargin{1.0});
        end % if
    case 'desLoadSLPort'
        % 95 97
        if not(des_ignore_port_proc)
            local_port_load(block, varargin{1.0});
        end % if
    case 'desUndoDeleteSLPort'
        % 100 102
        if not(des_ignore_port_proc)
            local_port_undo_delete(block, varargin{1.0});
        end % if
    case 'desFCSSInit'
        % 105 107
        local_fcss_init(block);
    case 'desOpenSystemFcn'
        % 108 110
        open_system(horzcat(block, '/FCSS'));
    case 'desOpenTrigSystemFcn'
        % 111 113
        open_trig_system(block);
    case 'desFcnCallWidget'
        % 114 116
        local_fcncall_widget(block, varargin{1.0});
    case 'undoDeleteFcn'
        gcbh
    otherwise
        warning(horzcat('Illegal value for action, ''', action, ''', in des_support call from ''', blkName, '''.'));
        % 120 123
        % 121 123
    end % switch
    % 123 125
    if des_support_debug
        disp(horzcat('ending @@ des_support(', action, ',', num2str(block), '[', blkName, '],', varargin{:}, ')'));
    end % if
function local_delete_solver_ss_children(solver_ss)
    % 128 139
    % 129 139
    % 130 139
    % 131 139
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    childBlocks = get_param(solver_ss, 'Blocks');
    lines = get_param(solver_ss, 'Lines');
    % 140 142
    for idx=1.0:length(childBlocks)
        delete_block(horzcat(solver_ss, '/', childBlocks{idx}));
    end % for
    for idx_lines=1.0:length(lines)
        delete_line(lines(idx_lines).Handle);
    end % for
function local_port_add_to_des_fcss(block, porttype)
    % 148 161
    % 149 161
    % 150 161
    % 151 161
    % 152 161
    % 153 161
    % 154 161
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    [vssPath, portSource, portBlock, leftPort, rightPort, strLblIdx, strPortIdx] = local_create_port_names(block, porttype);
    % 161 164
    % 162 164
    blockName = get_param(block, 'name');
    % 164 166
    ud = get_param(block, 'userdata');
    try
        parent = get_param(block, 'parent');
        % 168 170
        if not(strcmp('FCSS', get_param(parent, 'name')))
            % 170 174
            % 171 174
            % 172 174
            get_param(portBlockPath, 'name');
        else
            % 175 177
            load_system('des_sfun_lib');
            oldParent = get_param(ud.oldPath, 'parent');
            if strcmp(get_param(parent, 'name'), 'des_sfun_lib')
                return;
            end % if
        end % if
    catch
        return;
    end % try
    % 185 188
    % 186 188
    try
        add_block(portSource, portBlock, 'port', strPortIdx);
        % 189 192
        % 190 192
    end % try
    % 192 194
    try
        add_line(vssPath, leftPort, rightPort);
        % 195 198
        % 196 198
    end % try
    % 198 200
    ud.oldPath = block;
    ud.oldName = get_param(ud.oldPath, 'name');
    % 201 203
    set_param(block, 'userdata', ud);
    % 203 205
    return;
function delete_defcg_in_ss(block)
    % 206 219
    % 207 219
    % 208 219
    % 209 219
    % 210 219
    % 211 219
    % 212 219
    % 213 219
    % 214 219
    % 215 219
    % 216 219
    % 217 219
    if strcmpi(get_param(bdroot(block), 'lock'), 'on') || strcmpi(get_param(bdroot(block), 'name'), 'simeventsportsubsys1')
        % 219 221
        return;
    end % if
    % 222 225
    % 223 225
    blockName = get_param(block, 'name');
    % 225 228
    % 226 228
    parent = get_param(block, 'parent');
    % 228 232
    % 229 232
    % 230 232
    inportBlocks = find_system(parent, 'LookUnderMasks', 'all', 'DeleteFcn', 'des_support(''desDeleteSLPort'',gcb,''in'')', 'blocktype', 'Inport');
    % 232 235
    % 233 235
    outportBlocks = find_system(parent, 'LookUnderMasks', 'all', 'DeleteFcn', 'des_support(''desDeleteSLPort'',gcb,''out'')', 'blocktype', 'Outport');
    % 235 242
    % 236 242
    % 237 242
    % 238 242
    % 239 242
    % 240 242
    for idx=1.0:length(inportBlocks)
        set_param(char(inportBlocks{idx}), 'DeleteFcn', '');
    end % for
    for idx=1.0:length(outportBlocks)
        set_param(char(outportBlocks{idx}), 'DeleteFcn', '')
    end % for
    % 247 249
    return;
function local_port_delete_to_des_fcss(block, porttype)
    % 250 262
    % 251 262
    % 252 262
    % 253 262
    % 254 262
    % 255 262
    % 256 262
    % 257 262
    % 258 262
    % 259 262
    % 260 262
    if strcmpi(get_param(bdroot(block), 'lock'), 'on') || strcmpi(get_param(bdroot(block), 'name'), 'simeventsportsubsys1')
        % 262 264
        return;
    end % if
    % 265 267
    parent = get_param(block, 'parent');
    if not(strcmp('FCSS', get_param(parent, 'name')))
        return;
    end % if
    % 270 273
    % 271 273
    [vssPath, portSource, portBlock, leftPort, rightPort, strLblIdx, strPortIdx] = local_create_port_names(block, porttype);
    % 273 276
    % 274 276
    blockName = get_param(block, 'name');
    % 276 279
    % 277 279
    switch porttype
    case 'in'
        leftPort = horzcat(blockName, '/1');
    case 'out'
        rightPort = horzcat(blockName, '/1');
    otherwise
        warning(horzcat('Illegal value for action, ''', action, ''', in des_support call from ''', blkName, '''.'));
        % 285 287
    end % switch
    % 287 290
    % 288 290
    try
        delete_line(vssPath, leftPort, rightPort);
        % 291 294
        % 292 294
    end % try
    % 294 296
    try
        delete_block(horzcat(vssPath, '/', blockName));
        % 297 300
        % 298 300
    end % try
function local_port_name_change(block, varargin)
    % 301 316
    % 302 316
    % 303 316
    % 304 316
    % 305 316
    % 306 316
    % 307 316
    % 308 316
    % 309 316
    % 310 316
    % 311 316
    % 312 316
    % 313 316
    % 314 316
    blockName = get_param(block, 'name');
    fcssPath = get_param(block, 'parent');
    fcssName = get_param(fcssPath, 'name');
    vssPath = get_param(fcssPath, 'parent');
    % 319 321
    ud = get_param(block, 'userdata');
    oldName = ud.oldName;
    ud.oldName = blockName;
    ud.oldPath = block;
    % 324 326
    vssPortPath = horzcat(vssPath, '/', oldName);
    newPortPath = horzcat(vssPath, '/', blockName);
    % 327 330
    % 328 330
    try
        set_param(vssPortPath, 'name', blockName);
        set_param(block, 'userdata', ud);
    catch
        warning(horzcat('Warning while changing name of block, ', block, ' to ', portName, '.  warning code: ', lastwarn));
    end % try
function local_port_load(block, porttype)
    % 336 350
    % 337 350
    % 338 350
    % 339 350
    % 340 350
    % 341 350
    % 342 350
    % 343 350
    % 344 350
    % 345 350
    % 346 350
    % 347 350
    % 348 350
    ud = get_param(block, 'userdata');
    % 350 352
    switch porttype
    case 'in'
        ud.oldName = 'in1';
    case 'out'
        ud.oldName = 'out1';
    otherwise
        warning(horzcat('Illegal value for action, ''', action, ''', in des_support call from ''', blkName, '''.'));
        % 358 360
    end % switch
    ud.oldPath = horzcat(get_param(block, 'parent'), '/', ud.oldName);
    % 361 363
    set_param(block, 'userdata', ud);
function local_port_undo_delete(block, varargin)
    % 364 375
    % 365 375
    % 366 375
    % 367 375
    % 368 375
    % 369 375
    % 370 375
    % 371 375
    % 372 375
    % 373 375
    errMsg = horzcat('Error undoing the delete of discrete event subsystem ports.', '   This feature is not supported.  Please delete the port that you', ' just undeleted and get a new port from the ', des_getproductname, ' Ports and Substems library.');
    % 375 380
    % 376 380
    % 377 380
    % 378 380
    errordlg(errMsg, 'Signal Port Placement Error', 'replace');
    % 380 382
    error(horzcat(des_getproductname, ':UnDeleteDesSubsystemPorts'), errMsg);
    % 382 388
    % 383 388
    % 384 388
    % 385 388
    % 386 388
    return;
function local_init_ud_sl_port(block, blockname, libname)
    % 389 405
    % 390 405
    % 391 405
    % 392 405
    % 393 405
    % 394 405
    % 395 405
    % 396 405
    % 397 405
    % 398 405
    % 399 405
    % 400 405
    % 401 405
    % 402 405
    % 403 405
    ud = get_param(block, 'userdata');
    % 405 407
    ud.oldPath = horzcat(libname, '/', blockname);
    ud.oldName = blockname;
    % 408 410
    set_param(block, 'userdata', ud);
function local_fcncall_widget(block, action)
    % 411 425
    % 412 425
    % 413 425
    % 414 425
    % 415 425
    % 416 425
    % 417 425
    % 418 425
    % 419 425
    % 420 425
    % 421 425
    % 422 425
    % 423 425
    parent = get_param(gcb, 'parent');
    fcBlock = horzcat(parent, '/function');
    switch action
    case 'hide'
        set_param(fcBlock, 'position', [0.0 0.0 0.0 0.0], 'foregroundcolor', 'gray', 'showname', 'off');
    case 'show'
        set_param(fcBlock, 'position', [10.0 10.0 40.0 40.0], 'foregroundcolor', 'black', 'showname', 'on');
    otherwise
        error('incorrect value for action.');
    end % switch
function [vssPath, portSource, portBlock, leftPort, rightPort, strPortlbl, strPortidx] = local_create_port_names(block, porttype)
    % 435 455
    % 436 455
    % 437 455
    % 438 455
    % 439 455
    % 440 455
    % 441 455
    % 442 455
    % 443 455
    % 444 455
    % 445 455
    % 446 455
    % 447 455
    % 448 455
    % 449 455
    % 450 455
    % 451 455
    % 452 455
    % 453 455
    blockName = get_param(block, 'name');
    fcssPath = get_param(block, 'parent');
    fcssName = get_param(fcssPath, 'name');
    vssPath = get_param(fcssPath, 'parent');
    vssName = get_param(vssPath, 'name');
    vssInportNameRoot = 'in';
    vssOutportNameRoot = 'out';
    fcssInportNameRoot = 'in';
    fcssOutportNameRoot = 'out';
    vssInportName = horzcat(vssInportNameRoot, strtok(blockName, fcssInportNameRoot));
    vssOutportName = horzcat(vssOutportNameRoot, strtok(blockName, fcssOutportNameRoot));
    libSource = 'des_sfun_lib';
    vssInportSource = horzcat(libSource, '/', vssInportNameRoot, '1');
    vssOutportSource = horzcat(libSource, '/', vssOutportNameRoot, '1');
    ud = get_param(block, 'userdata');
    % 469 472
    % 470 472
    switch porttype
    case 'in'
        strPortlbl = strtok(blockName, fcssInportNameRoot);
        strPortidx = get_param(block, 'Port');
        portSource = vssInportSource;
        portBlock = horzcat(vssPath, '/', blockName);
        leftPort = horzcat(blockName, '/1');
        foundPath = find_system(fcssPath, 'port', strPortidx, 'BlockType', 'Inport');
        foundName = get_param(foundPath, 'name');
        namePortIdx = strtok(foundName, fcssInportNameRoot);
        fcssPortidx = str2num(strPortidx);
        ph = get_param(fcssPath, 'porthandles');
        portNumber = get_param(ph.Inport(fcssPortidx), 'portnumber');
        rightPort = horzcat(fcssName, '/', num2str(portNumber));
        strPortidx = num2str(plus(str2num(strPortidx), 1.0));
    case 'out'
        strPortlbl = strtok(blockName, fcssOutportNameRoot);
        strPortidx = get_param(block, 'Port');
        portSource = vssOutportSource;
        portBlock = horzcat(vssPath, '/', vssOutportName);
        rightPort = horzcat(vssOutportName, '/1');
        foundPath = find_system(fcssPath, 'port', strPortidx, 'BlockType', 'Outport');
        foundName = get_param(foundPath, 'name');
        namePortIdx = strtok(foundName, fcssOutportNameRoot);
        fcssPortidx = str2num(strPortidx);
        ph = get_param(fcssPath, 'porthandles');
        portNumber = get_param(ph.Outport(fcssPortidx), 'portnumber');
        leftPort = horzcat(fcssName, '/', num2str(portNumber));
    otherwise
        warning(horzcat('Illegal value for action, ''', action, ''', in des_support call from ''', blkName, '''.'));
        % 501 503
    end % switch
function local_fcss_init(block)
    % 504 508
    % 505 508
    % 506 508
    warning(horzcat('In local_fcss_init for the ', block, ' block.'));
function open_trig_system(block)
