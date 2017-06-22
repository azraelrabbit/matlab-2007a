function [UserArray, UserArrayName] = makeArray(hIntermediate)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    UserArray = [];
    UserArrayName = '';
    % 10 13
    % 11 13
    ArrayNodeList = hIntermediate.ArrayNodeList;
    % 13 16
    % 14 16
    if ~(isempty(ArrayNodeList))
        % 16 19
        % 17 19
        UserNodes = find(ArrayNodeList, 'Parent', -1.0);
        SourceNodes = find(ArrayNodeList, 'Parent', 0.0);
        % 20 23
        % 21 23
        UserNodes = s_sortOnPrecedence(hIntermediate, UserNodes);
        SourceNodes = s_sortOnPrecedence(hIntermediate, SourceNodes);
        % 24 27
        % 25 27
        NumUserNodes = numel(UserNodes);
        % 27 30
        % 28 30
        DefinitionNodes = vertcat(UserNodes, SourceNodes);
        % 30 33
        % 31 33
        for idx=1.0:length(DefinitionNodes)
            % 33 35
            [Array, ArrayName] = s_createArray(hIntermediate, DefinitionNodes(idx), []);
            % 35 39
            % 36 39
            % 37 39
            if le(idx, NumUserNodes)
                % 39 41
                UserArray{idx, 1.0} = Array;
                UserArrayName{idx, 1.0} = ArrayName;
            end
        end % for
    end
    % 45 47
end
function [Array, ArrayName] = s_createArray(hIntermediate, hArrayNode, ParentArray)
    % 48 60
    % 49 60
    % 50 60
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    ArrayName = hArrayNode.Name;
    % 60 63
    % 61 63
    switch hArrayNode.FunctionalType
    case 'char'
        % 64 66
        Array = s_createChar(hArrayNode);
    case 'numeric'
        % 67 70
        % 68 70
        Array = s_createNumeric(hArrayNode);
    case 'logical'
        % 71 74
        % 72 74
        Array = s_createLogical(hArrayNode);
    case 'udd_object'
        % 75 78
        % 76 78
        Array = s_createUDDObject(hIntermediate, hArrayNode, ParentArray);
    case 'udd_value'
        % 79 82
        % 80 82
        Array = s_createUDDValue(hIntermediate, hArrayNode, ParentArray);
    case 'struct'
        % 83 86
        % 84 86
        Array = s_createStruct(hIntermediate, hArrayNode);
    case 'cell'
        % 87 90
        % 88 90
        Array = s_createCell(hIntermediate, hArrayNode);
    otherwise
        % 91 94
        % 92 94
        Array = [];
        % 94 97
        % 95 97
        warning('off', 'backtrace')
        warning('JAD:JAD233232', 'The unexpected type "%s" was encountered and will be skipped.', hArrayNode.FunctionalType);
        % 98 101
        % 99 101
        warning('on', 'backtrace')
    end
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
end
function Array = s_createChar(hArrayNode)
    % 109 119
    % 110 119
    % 111 119
    % 112 119
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    Array = s_safeReshape(hArrayNode.Value, hArrayNode.Dimensions);
    % 119 121
end
function Array = s_createNumeric(hArrayNode)
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    Array = s_safeReshape(hArrayNode.Value, hArrayNode.Dimensions);
    % 129 131
end
function Array = s_createLogical(hArrayNode)
    % 132 140
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    Array = s_safeReshape(hArrayNode.Value, hArrayNode.Dimensions);
    % 140 142
end
function Array = s_createUDDObject(hIntermediate, hArrayNode, ParentArray)
    % 143 152
    % 144 152
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    Array = [];
    % 152 155
    % 153 155
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 155 157
        [Array, SourceFromParent] = hIntermediate.addSourceToSourceList(hArrayNode, ParentArray);
        % 157 161
        % 158 161
        % 159 161
        if ~(isempty(Array)) && isequal(hArrayNode.Parent, 0.0)
            % 161 163
            for idx=1.0:length(hArrayNode.Children)
                % 163 165
                [PropertyArray, PropertyArrayName] = s_createArray(hIntermediate, hArrayNode.Children(idx), Array);
                % 165 169
                % 166 169
                % 167 169
                s_setPropInObject(Array, PropertyArray, PropertyArrayName);
            end % for
        end
    else
        % 172 175
        % 173 175
        for idx=1.0:length(hArrayNode.Children)
            % 175 177
            [Element, ElementName{idx}] = s_createArray(hIntermediate, hArrayNode.Children(idx), []);
            % 177 181
            % 178 181
            % 179 181
            if ~(isempty(Element))
                % 181 183
                if ~(isempty(Array))
                    % 183 185
                    Array(idx) = Element;
                else
                    % 186 189
                    % 187 189
                    Array = Element;
                end
            end
            % 191 193
        end % for
    end
    % 194 197
    % 195 197
    Array = s_safeReshape(Array, hArrayNode.Dimensions);
    % 197 199
end
function Array = s_createUDDValue(hIntermediate, hArrayNode, ParentArray)
    % 200 210
    % 201 210
    % 202 210
    % 203 210
    % 204 210
    % 205 210
    % 206 210
    % 207 210
    % 208 210
    Array = [];
    % 210 213
    % 211 213
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 213 215
        [Array, SourceFromParent] = hIntermediate.constructObject(hArrayNode, ParentArray);
        % 215 219
        % 216 219
        % 217 219
        if ~(isempty(Array))
            % 219 221
            for idx=1.0:length(hArrayNode.Children)
                % 221 223
                [PropertyArray, PropertyArrayName] = s_createArray(hIntermediate, hArrayNode.Children(idx), Array);
                % 223 227
                % 224 227
                % 225 227
                s_setPropInObject(Array, PropertyArray, PropertyArrayName);
            end % for
        end
    else
        % 230 233
        % 231 233
        for idx=1.0:length(hArrayNode.Children)
            % 233 235
            [Element, ElementName] = s_createArray(hIntermediate, hArrayNode.Children(idx), []);
            % 235 239
            % 236 239
            % 237 239
            if ~(isempty(Element))
                % 239 241
                if ~(isempty(Array))
                    % 241 243
                    Array(idx) = Element;
                else
                    % 244 247
                    % 245 247
                    Array = Element;
                end
            end
        end % for
    end
    % 251 254
    % 252 254
    Array = s_safeReshape(Array, hArrayNode.Dimensions);
    % 254 256
end
function Array = s_createStruct(hIntermediate, hArrayNode)
    % 257 267
    % 258 267
    % 259 267
    % 260 267
    % 261 267
    % 262 267
    % 263 267
    % 264 267
    % 265 267
    Array = struct([]);
    % 267 270
    % 268 270
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 270 272
        for idx=1.0:length(hArrayNode.Children)
            % 272 274
            [FieldArray, FieldArrayName] = s_createArray(hIntermediate, hArrayNode.Children(idx), []);
            % 274 278
            % 275 278
            % 276 278
            Array(1.0).(FieldArrayName) = FieldArray;
        end % for
    else
        % 280 283
        % 281 283
        for idx=1.0:length(hArrayNode.Children)
            % 283 285
            [Element, ElementName] = s_createArray(hIntermediate, hArrayNode.Children(idx), []);
            % 285 289
            % 286 289
            % 287 289
            if ~(isempty(Element))
                % 289 291
                if ~(isempty(Array))
                    % 291 293
                    Array(idx) = Element;
                else
                    % 294 297
                    % 295 297
                    Array = Element;
                end
            end
        end % for
    end
    % 301 304
    % 302 304
    Array = s_safeReshape(Array, hArrayNode.Dimensions);
    % 304 306
end
function Array = s_createCell(hIntermediate, hArrayNode)
    % 307 316
    % 308 316
    % 309 316
    % 310 316
    % 311 316
    % 312 316
    % 313 316
    % 314 316
    Array = cell(hArrayNode.Dimensions);
    % 316 319
    % 317 319
    for idx=1.0:length(hArrayNode.Children)
        % 319 321
        [Array{idx}, ArrayName{idx}] = s_createArray(hIntermediate, hArrayNode.Children(idx), []);
        % 321 323
    end % for
    % 323 326
    % 324 326
    Array = s_safeReshape(Array, hArrayNode.Dimensions);
    % 326 328
end
function s_setPropInObject(Array, PropertyArray, PropertyArrayName)
    % 329 339
    % 330 339
    % 331 339
    % 332 339
    % 333 339
    % 334 339
    % 335 339
    % 336 339
    % 337 339
    try
        set(Array, PropertyArrayName, PropertyArray);
    catch
        % 341 343
        warning('off', 'backtrace')
        warning('JAD:JAD32', 'The property "%s" could not be set', PropertyArrayName);
        warning('on', 'backtrace')
        % 345 347
    end % try
    % 347 349
end
function Array = s_safeReshape(Array, Dimensions)
    % 350 359
    % 351 359
    % 352 359
    % 353 359
    % 354 359
    % 355 359
    % 356 359
    % 357 359
    if isequal(prod(Dimensions), numel(Array))
        % 359 361
        Array = reshape(Array, Dimensions);
    else
        % 362 364
        warning('off', 'backtrace')
        warning('JAD:JAD990', 'An array could not be reshaped properly');
        warning('on', 'backtrace')
    end
    % 367 369
end
function Nodes = s_sortOnPrecedence(hIntermediate, Nodes)
    % 370 391
    % 371 391
    % 372 391
    % 373 391
    % 374 391
    % 375 391
    % 376 391
    % 377 391
    % 378 391
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
end
