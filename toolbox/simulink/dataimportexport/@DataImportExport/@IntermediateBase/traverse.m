function traverse(hIntermediate, OldArray, ArrayName, hParentArrayNode)
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
    Array = hIntermediate.callUserSaveFunction(OldArray, hParentArrayNode);
    % 13 16
    % 14 16
    FunctionalType = hIntermediate.getArrayFunctionalType(Array);
    % 16 20
    % 17 20
    % 18 20
    [SourceID, NeedToProcessFlag] = addObjectToSourceList(hIntermediate, Array, FunctionalType, hParentArrayNode);
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if NeedToProcessFlag
        % 25 27
        [SupportedFlag, Warning] = hIntermediate.isArraySupported(Array, FunctionalType);
        % 27 31
        % 28 31
        % 29 31
        hArrayNode = hIntermediate.addArrayNode(Array, ArrayName, FunctionalType, SourceID, hParentArrayNode);
        % 31 35
        % 32 35
        % 33 35
        if SupportedFlag
            % 35 37
            switch hArrayNode.FunctionalType
            case 'char'
                % 38 40
                s_traverseChar(Array, hArrayNode);
            case 'numeric'
                % 41 44
                % 42 44
                s_traverseNumeric(Array, hArrayNode);
            case 'logical'
                % 45 48
                % 46 48
                s_traverseLogical(Array, hArrayNode);
            case 'udd_object'
                % 49 52
                % 50 52
                s_traverseUDDObject(hIntermediate, Array, hArrayNode);
            case 'udd_value'
                % 53 56
                % 54 56
                s_traverseUDDValue(hIntermediate, Array, hArrayNode);
            case 'struct'
                % 57 60
                % 58 60
                s_traverseStruct(hIntermediate, Array, hArrayNode);
            case 'cell'
                % 61 64
                % 62 64
                s_traverseCell(hIntermediate, Array, hArrayNode);
            case 'udd_mixed'
                % 65 68
                % 66 68
                s_traverseUDDObject(hIntermediate, Array, hArrayNode);
                % 69 74
                % 70 74
                % 71 74
                % 72 74
            case 'ml_object'
                % 73 76
                % 74 76
                Warning = sprintf('Matlab objects are not supported and will be skipped.');
                % 77 79
            case 'java_object'
                % 78 81
                % 79 81
                Warning = sprintf('Java objects are not supported and will be skipped.');
                % 82 84
            case 'com_object'
                % 83 86
                % 84 86
                Warning = sprintf('COM objects are not supported and will be skipped.');
                % 87 89
            case 'function_handle'
                % 88 91
                % 89 91
                Warning = sprintf('Function handles are not supported and will be skipped.');
                % 92 94
            case 'handle'
                % 93 96
                % 94 96
                Warning = sprintf('Handles are not supported and will be skipped.');
            otherwise
                % 97 99
                % 98 101
                % 99 101
                Warning = sprintf('An unexpected type was encountered and will be skipped.');
                % 101 103
            end
        end
        % 104 107
        % 105 107
        if ~(isempty(Warning))
            disp(sprintf(horzcat('Warning:  ', Warning)));
        end
    end
    % 110 112
end
function s_traverseChar(Array, hArrayNode)
    % 113 129
    % 114 129
    % 115 129
    % 116 129
    % 117 129
    % 118 129
    % 119 129
    % 120 129
    % 121 129
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    hArrayNode.Value = Array;
    hArrayNode.ArrayType = 'Value';
    % 130 132
end
function s_traverseNumeric(Array, hArrayNode)
    % 133 143
    % 134 143
    % 135 143
    % 136 143
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    hArrayNode.Value = Array;
    hArrayNode.ArrayType = 'Value';
    % 144 146
end
function s_traverseLogical(Array, hArrayNode)
    % 147 157
    % 148 157
    % 149 157
    % 150 157
    % 151 157
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    hArrayNode.Value = Array;
    hArrayNode.ArrayType = 'Value';
    % 158 160
end
function s_traverseUDDObject(hIntermediate, Array, hArrayNode)
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 171 173
        if ~(isequal(hArrayNode.Parent, 0.0))
            % 173 175
            ArrayType = 'Reference';
        else
            % 176 180
            % 177 180
            % 178 180
            % 179 182
            % 180 182
            ArrayType = 'Children';
            % 182 189
            % 183 189
            % 184 189
            % 185 189
            % 186 189
            % 187 189
            AllReadablePropertyNames = hIntermediate.getAllReadablePropertyNames(Array);
            % 189 192
            % 190 192
            for j=1.0:length(AllReadablePropertyNames)
                % 192 194
                ObjectPropertyValue = hIntermediate.getDataObjectPropertyValue(Array, AllReadablePropertyNames{j});
                % 194 198
                % 195 198
                % 196 198
                hIntermediate.appendArrayQueue(ObjectPropertyValue, AllReadablePropertyNames{j}, hArrayNode);
                % 198 205
                % 199 205
                % 200 205
                % 201 205
                % 202 205
                % 203 205
            end % for
            % 205 213
            % 206 213
            % 207 213
            % 208 213
            % 209 213
            % 210 213
            % 211 213
        end
    else
        % 214 217
        % 215 217
        ArrayType = 'Children';
        % 217 220
        % 218 220
        for i=1.0:length(Array(:))
            % 220 222
            hIntermediate.appendArrayQueue(Array(i), '', hArrayNode);
        end % for
    end
    % 224 227
    % 225 227
    hArrayNode.ArrayType = ArrayType;
    % 227 229
end
function s_traverseUDDValue(hIntermediate, Array, hArrayNode)
    % 230 240
    % 231 240
    % 232 240
    % 233 240
    % 234 240
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 240 242
        AllReadablePropertyNames = hIntermediate.getAllReadablePropertyNames(Array);
        % 242 245
        % 243 245
        for j=1.0:length(AllReadablePropertyNames)
            % 245 247
            ObjectPropertyValue = hIntermediate.getDataObjectPropertyValue(Array, AllReadablePropertyNames{j});
            % 247 251
            % 248 251
            % 249 251
            hIntermediate.appendArrayQueue(ObjectPropertyValue, AllReadablePropertyNames{j}, hArrayNode);
            % 251 253
        end % for
    else
        % 254 257
        % 255 257
        for i=1.0:length(Array(:))
            % 257 259
            hIntermediate.appendArrayQueue(Array(i), '', hArrayNode);
        end % for
    end
    % 261 264
    % 262 264
    hArrayNode.ArrayType = 'Children';
    % 264 266
end
function s_traverseStruct(hIntermediate, Array, hArrayNode)
    % 267 277
    % 268 277
    % 269 277
    % 270 277
    % 271 277
    % 272 277
    % 273 277
    % 274 277
    % 275 277
    if isequal(prod(hArrayNode.Dimensions), 1.0)
        % 277 279
        AllFieldNames = fieldnames(Array);
        % 279 282
        % 280 282
        for i=1.0:length(AllFieldNames)
            % 282 284
            hIntermediate.appendArrayQueue(Array.(AllFieldNames{i}), AllFieldNames{i}, hArrayNode);
            % 284 286
        end % for
    else
        % 287 290
        % 288 290
        for i=1.0:length(Array(:))
            % 290 292
            hIntermediate.appendArrayQueue(Array(i), '', hArrayNode);
        end % for
    end
    % 294 297
    % 295 297
    hArrayNode.ArrayType = 'Children';
    % 297 299
end
function s_traverseCell(hIntermediate, Array, hArrayNode)
    % 300 310
    % 301 310
    % 302 310
    % 303 310
    % 304 310
    % 305 310
    % 306 310
    % 307 310
    % 308 310
    for i=1.0:length(Array(:))
        % 310 312
        hIntermediate.appendArrayQueue(Array{i}, '', hArrayNode);
    end % for
    % 313 316
    % 314 316
    hArrayNode.ArrayType = 'Children';
    % 316 318
end
