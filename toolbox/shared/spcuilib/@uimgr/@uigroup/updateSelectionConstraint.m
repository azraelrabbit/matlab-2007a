function updateSelectionConstraint(h, theSelectionConstraint)
    % 1 32
    % 2 32
    % 3 32
    % 4 32
    % 5 32
    % 6 32
    % 7 32
    % 8 32
    % 9 32
    % 10 32
    % 11 32
    % 12 32
    % 13 32
    % 14 32
    % 15 32
    % 16 32
    % 17 32
    % 18 32
    % 19 32
    % 20 32
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    if lt(nargin, 2.0)
        theSelectionConstraint = h.SelectionConstraint;
    end
    % 34 36
    switch lower(theSelectionConstraint)
    case 'selectone'
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        CheckConstraintRules(h);
        h.SelConInstall = @installSelectOne;
    case 'selectzeroorone'
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        CheckConstraintRules(h);
        h.SelConInstall = @installSelectZeroOrOne;
    case 'none'
        % 51 54
        % 52 54
        uninstallSelectionConstraints(h);
    otherwise
        % 55 57
        error('uimgr:UnsupportedConstraint', 'Unsupported SelectionConstraint option "%s".', theSelectionConstraint);
        % 57 60
        % 58 60
    end
    % 60 62
end
function ConstrainedItemChanged(hItem, ev, cType)
    % 63 79
    % 64 79
    % 65 79
    % 66 79
    % 67 79
    % 68 79
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    hGroup = hItem.up;
    allOnIdx = findOnItems(hGroup);
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    num_on = numel(allOnIdx);
    about_to_turn_on = strcmp(ev.NewValue, 'on');
    % 87 89
    if about_to_turn_on && gt(num_on, 0.0)
        % 89 104
        % 90 104
        % 91 104
        % 92 104
        % 93 104
        % 94 104
        % 95 104
        % 96 104
        % 97 104
        % 98 104
        % 99 104
        % 100 104
        % 101 104
        % 102 104
        theChild = hGroup.down;
        for onIdx=1.0:max(allOnIdx)
            if any(eq(onIdx, allOnIdx))
                % 106 116
                % 107 116
                % 108 116
                % 109 116
                % 110 116
                % 111 116
                % 112 116
                % 113 116
                % 114 116
                theWidget = handle(theChild.hWidget);
                hListener = theWidget.uimgr_SelConListener;
                % 117 122
                % 118 122
                % 119 122
                % 120 122
                hListener.enabled = 'off';
                set(theChild.hWidget, theChild.StateName, 'off');
                hListener.enabled = 'on';
            end
            theChild = theChild.right;
        end % for
    else
        if ~(about_to_turn_on) && eq(num_on, 1.0) && eq(cType, 1.0)
            % 129 144
            % 130 144
            % 131 144
            % 132 144
            % 133 144
            % 134 144
            % 135 144
            % 136 144
            % 137 144
            % 138 144
            % 139 144
            % 140 144
            % 141 144
            % 142 144
            selectionConstraintRestore(hItem);
        end
    end
end
function installSelectOne(hGroup, ev)
    % 148 156
    % 149 156
    % 150 156
    % 151 156
    % 152 156
    % 153 156
    % 154 156
    addChildStateListeners(hGroup, 1.0);
end
function installSelectZeroOrOne(hGroup, ev)
    % 158 160
    addChildStateListeners(hGroup, 0.0);
end
function addChildStateListeners(hGroup, cType)
    % 162 176
    % 163 176
    % 164 176
    % 165 176
    % 166 176
    % 167 176
    % 168 176
    % 169 176
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    uninstallSelectionConstraintListeners(hGroup);
    % 176 184
    % 177 184
    % 178 184
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    initConstraints(hGroup);
    % 184 188
    % 185 188
    % 186 188
    widgetSelConProp = 'uimgr_SelConListener';
    theChild = hGroup.down;
    while ~(isempty(theChild))
        % 190 195
        % 191 195
        % 192 195
        % 193 195
        if isempty(theChild.hWidget)
            % 195 197
            error('uimgr:ConstraintWidgetNotFound', 'Item "%s" in group "%s" does not have a rendered widget,\nwhich is required to apply SelectionConstraint.', theChild.name, hGroup.name);
            % 197 201
            % 198 201
            % 199 201
        end
        theWidget = handle(theChild.hWidget);
        % 202 207
        % 203 207
        % 204 207
        % 205 207
        hProp = theWidget.findprop(theChild.StateName);
        if isempty(hProp)
            % 208 210
            uninstallSelectionConstraints(hGroup);
            error('uimgr:ConstraintPropertyNotFound', 'Widget for item "%s" in group "%s" does not support property "%s",\nwhich is required to apply SelectionConstraint.', theChild.name, hGroup.name, theChild.StateName);
            % 211 215
            % 212 215
            % 213 215
        end
        % 215 222
        % 216 222
        % 217 222
        % 218 222
        % 219 222
        % 220 222
        cbFcn = @(hh,ev)ConstrainedItemChanged(theChild,ev,cType);
        % 222 228
        % 223 228
        % 224 228
        % 225 228
        % 226 228
        hListen = handle.listener(theWidget, hProp, 'PropertyPreSet', cbFcn);
        % 228 234
        % 229 234
        % 230 234
        % 231 234
        % 232 234
        if isempty(theWidget.findprop(widgetSelConProp))
            hDynProp = schema.prop(theWidget, widgetSelConProp, 'handle.listener vector');
            % 235 237
            hDynProp.Visible = 'off';
        end
        % 238 241
        % 239 241
        if ~(isempty(theWidget.(widgetSelConProp)))
            error('ASSERT: Attempt to add SelectionConstraint listener with one already in place');
            % 242 244
        end
        % 244 248
        % 245 248
        % 246 248
        theWidget.(widgetSelConProp) = hListen;
        % 248 250
        theChild = theChild.right;
    end % while
    % 251 253
end
function initConstraints(hGroup)
    % 254 265
    % 255 265
    % 256 265
    % 257 265
    % 258 265
    % 259 265
    % 260 265
    % 261 265
    % 262 265
    % 263 265
    switch lower(hGroup.SelectionConstraint)
    case 'selectone'
        % 266 273
        % 267 273
        % 268 273
        % 269 273
        % 270 273
        % 271 273
        [isOn, numOn] = getConstraintPropVal(hGroup);
        if eq(numOn, 0.0)
            turnOnFirstChild(hGroup);
        else
            if gt(numOn, 1.0)
                turnOffAllButFirstChild(hGroup, isOn);
            end
        end
    case 'selectzeroorone'
        % 281 286
        % 282 286
        % 283 286
        % 284 286
        [isOn, numOn] = getConstraintPropVal(hGroup);
        if gt(numOn, 1.0)
            turnOffAllButFirstChild(hGroup, isOn);
        end
    otherwise
        % 290 293
        % 291 293
    end
    % 293 295
end
function turnOffAllButFirstChild(hGroup, isOn)
    % 296 309
    % 297 309
    % 298 309
    % 299 309
    % 300 309
    % 301 309
    % 302 309
    % 303 309
    % 304 309
    % 305 309
    % 306 309
    % 307 309
    [childPlaceObj, childPlaceIdx] = computeChildOrder(hGroup);
    isOn = isOn(childPlaceIdx);
    firstIdx = find(isOn, 1.0);
    % 311 314
    % 312 314
    toTurnOff = isOn;
    toTurnOff(firstIdx) = false;
    % 315 317
    if ~(isempty(toTurnOff))
        % 317 323
        % 318 323
        % 319 323
        % 320 323
        % 321 323
        childPlaceObj = childPlaceObj(toTurnOff);
        for childItem=childPlaceObj
            % 324 327
            % 325 327
            set(childItem.hWidget, childItem.StateName, 'off');
            % 327 332
            % 328 332
            % 329 332
            % 330 332
        end % for
    end
    % 333 335
end
function turnOnFirstChild(hGroup)
    % 336 343
    % 337 343
    % 338 343
    % 339 343
    % 340 343
    % 341 343
    childOrderObj = computeChildOrder(hGroup);
    childItem = childOrderObj(1.0);
    set(childItem.hWidget, childItem.StateName, 'on');
    % 345 351
    % 346 351
    % 347 351
    % 348 351
    % 349 351
end
function CheckConstraintRules(h)
    % 352 360
    % 353 360
    % 354 360
    % 355 360
    % 356 360
    % 357 360
    % 358 360
    if hasChildGroups(h)
        error('uimgr:CannotApplyConstraint', 'Cannot apply SelectionConstraint to group "%s" containing child groups.', h.Name);
        % 361 364
        % 362 364
    end
    % 364 368
    % 365 368
    % 366 368
    hChild = h.down;
    while ~(isempty(hChild))
        if ~(hChild.AllowSelectionConstraint)
            error('uimgr:ConstraintNotAllowed', 'Child "%s" in group "%s" disallows SelectionConstraints.', hChild.Name, h.Name);
            % 371 374
            % 372 374
        end
        hChild = hChild.right;
    end % while
    % 376 378
end
function uninstallSelectionConstraintListeners(hGroup)
    % 379 391
    % 380 391
    % 381 391
    % 382 391
    % 383 391
    % 384 391
    % 385 391
    % 386 391
    % 387 391
    % 388 391
    % 389 391
    widgetSelConProp = 'uimgr_SelConListener';
    hChild = hGroup.down;
    while ~(isempty(hChild))
        theWidget = handle(hChild.hWidget);
        if ishandle(theWidget)
            if ~(isempty(findprop(theWidget, widgetSelConProp)))
                % 396 398
                delete(theWidget.(widgetSelConProp));
                theWidget.(widgetSelConProp) = [];
            end
        end
        hChild = hChild.right;
    end % while
    % 403 405
end
function uninstallSelectionConstraints(h)
    % 406 411
    % 407 411
    % 408 411
    % 409 411
    uninstallSelectionConstraintListeners(h);
    % 411 414
    % 412 414
    h.SelConInstall = [];
    % 414 416
end
